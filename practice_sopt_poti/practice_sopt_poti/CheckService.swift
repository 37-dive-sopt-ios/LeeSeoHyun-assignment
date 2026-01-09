//
//  CheckService.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/9/26.
//

import Combine
import CombineMoya
import Moya
import UIKit
import Alamofire

protocol CheckServiceType {
    func getCheckTitle(id: Int) -> AnyPublisher<State, Error>
}

enum CheckAPI {
    case getCheck(id: Int)
}

extension CheckAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .getCheck(let id):
            return "/posts/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCheck:
            return .get
        }
    }
    
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

final class CheckService: CheckServiceType {
    private let provider: MoyaProvider<CheckAPI>
    
    init(provider: MoyaProvider<CheckAPI> = .init()) {
        self.provider = provider
    }
    
    
    
    func getCheckTitle(id: Int) -> AnyPublisher<State, Error> {
        
        provider.requestPublisher(.getCheck(id: id))
            .map(State.self)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
        
//        let url = URL(string: "https://jsonplaceholder.typicode.com")!
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .catch { error in
//                return Fail(error: error).eraseToAnyPublisher()
//            }.map({ $0.data })
//            .decode(type: State.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
    }
}
