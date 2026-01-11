//
//  CheckViewModel.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import Combine
import UIKit

final class CheckViewModel{
    private let checkUseCase: CheckUseCase

    init(checkUseCase: CheckUseCase) {
        self.checkUseCase = checkUseCase
    }
    
    enum Input {
        case viewDidAppear
        case checkButtonDidTap
        case ratingChanged(Double)
        case ratingFinished(Double)
    }
    
    enum Output {
        case fetchCheckDidFail(error: Error)
        case fetchCheckDidSucceed(entity: CheckEntity)
        case enableButton(isEnabled: Bool)
        case renderRating(rating: Double, isButtonEnabled: Bool)
    }
    
    private(set) var cancellables = Set<AnyCancellable>()
    private(set) var output: PassthroughSubject<Output, Never> = .init()
    private var postId: Int = 1
    private var currentRating: Double = 0.5
    private let minRating: Double = 0.5
    private let maxRating: Double = 5.0
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input
            .sink { [weak self] event in
                guard let self else { return }
                switch event {
                case .viewDidAppear:
                    self.handleCheck(id: self.postId)
                case .checkButtonDidTap:
                    self.postId += 1
                    self.handleCheck(id: self.postId)
                case .ratingChanged(let rating):
                    let clamped = min(max(rating, self.minRating), self.maxRating)
                    self.currentRating = clamped
                    self.output.send(.renderRating(rating: clamped, isButtonEnabled: clamped >= self.minRating))
                case .ratingFinished(let rating):
                    let clamped = min(max(rating, self.minRating), self.maxRating)
                    self.currentRating = clamped
                    self.output.send(.renderRating(rating: clamped, isButtonEnabled: clamped >= self.minRating))
                }
            }
            .store(in: &cancellables)

        return output.eraseToAnyPublisher()
    }

    private func handleCheck(id: Int) {
        Task { [weak self] in
            guard let self else { return }

            do {
                let entity = try await checkUseCase.check(id: id)
                await MainActor.run {
                    self.output.send(.fetchCheckDidSucceed(entity: entity))
                }
            } catch {
                await MainActor.run {
                    self.output.send(.fetchCheckDidFail(error: error))
                }
            }
        }
    }
}

