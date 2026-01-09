//
//  ManageViewController.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import Combine
import UIKit

final class CheckViewModel{
    
    enum Input {
        case viewDidAppear
        case checkButtonTapped
    }
    
    enum Output {
        case fetchCheckDidFail(error: Error)
        case fetchCheckDidSucceed(state: State)
        case enableButton(isEnabled: Bool)
    }
    
    private(set) var cancellables = Set<AnyCancellable>()
    private(set) var output: PassthroughSubject<Output, Never> = .init()
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        <#code#>
    }
    
    
}

protocol CheckServiceType {
    func getCheckTitle() -> AnyPublisher<State, Error>
}

class CheckService: CheckServiceType {
    func getCheckTitle() -> AnyPublisher<State, Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .catch { error in
                return Fail(error: error).eraseToAnyPublisher()
            }.map({ $0.data })
            .decode(type: State.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


enum State: Decodable {
    case checked
    case checking
    case notChecked
}

