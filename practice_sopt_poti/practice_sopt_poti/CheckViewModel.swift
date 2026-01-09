//
//  CheckViewController.swift
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
    }
    
    enum Output {
        case fetchCheckDidFail(error: Error)
        case fetchCheckDidSucceed(state: State)
        case enableButton(isEnabled: Bool)
    }
    
    private(set) var cancellables = Set<AnyCancellable>()
    private(set) var output: PassthroughSubject<Output, Never> = .init()
    private var postId: Int = 1
    
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
                }
            }
            .store(in: &cancellables)

        return output.eraseToAnyPublisher()
    }
    
    private func handleGetCheckTitle(id: Int) {
        print("🥹 request id:", id)
        checkServiceType.getCheckTitle(id: id)
            .sink(
                receiveCompletion: { [weak self] completion in
                    print("👊 completion:", completion)
                    if case .failure(let error) = completion {
                        self?.output.send(.fetchCheckDidFail(error: error))
                    }
                },
                receiveValue: { [weak self] state in
                    print("✅ title:", state.title)
                    self?.output.send(.fetchCheckDidSucceed(state: state))
                })
            .store(in: &cancellables)
    }
    
}

struct State: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

