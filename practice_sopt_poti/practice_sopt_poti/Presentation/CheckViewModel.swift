//
//  CheckViewModel.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import Combine
import UIKit

final class CheckViewModel{
    private let checkServiceType: CheckServiceType
    
    
    init(checkServiceType: CheckServiceType = CheckService()) {
        self.checkServiceType = checkServiceType
    }
    
    enum Input {
        case viewDidAppear
        case checkButtonDidTap
        case ratingChanged(Double)
        case ratingFinished(Double)
    }
    
    enum Output {
        case fetchCheckDidFail(error: Error)
        case fetchCheckDidSucceed(state: State)
        case enableButton(isEnabled: Bool)
        case renderRating(rating: Double, isButtonEnabled: Bool)
    }
    
    private(set) var cancellables = Set<AnyCancellable>()
    private(set) var output: PassthroughSubject<Output, Never> = .init()
    private var postId: Int = 1
    private var currentRating: Double = 0.0
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input
            .sink { [weak self] event in
                guard let self else { return }
                switch event {
                case .viewDidAppear:
                    self.handleGetCheckTitle(id: self.postId)

                case .checkButtonDidTap:
                    self.postId += 1
                    self.handleGetCheckTitle(id: self.postId)
                
                case .ratingChanged(let rating):
                    self.currentRating = currentRating
                    self.output.send(.renderRating(rating: currentRating, isButtonEnabled: rating > 0))
                case .ratingFinished(let rating):
                    self.currentRating
                    self.output.send(.renderRating(rating: currentRating, isButtonEnabled: rating > 0))
                }
            }
            .store(in: &cancellables)

        return output.eraseToAnyPublisher()
    }
    
    private func handleGetCheckTitle(id: Int) {
        Task { [weak self] in
            guard let self else { return }
            
            do {
                let state = try await checkServiceType.getCheckTitle(id: id)
                
                await MainActor.run {
                    self.output.send(.fetchCheckDidSucceed(state: state))
                }
                
            } catch {
                await MainActor.run {
                    self.output.send(.fetchCheckDidFail(error: error))
                }
            }
        }
    }
}

struct State: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

