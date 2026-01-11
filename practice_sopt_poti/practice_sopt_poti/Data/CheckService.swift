//
//  CheckService.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/9/26.
//

import Combine
import Moya
import UIKit
import Alamofire


protocol CheckServiceType {
    func getCheckTitle(id: Int) async throws -> CheckDTO
}

struct CheckDTO: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
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
    private let provider = MoyaProvider<CheckAPI>()
    
    func getCheckTitle(id: Int) async throws -> CheckDTO {
        let response: Response = try await withCheckedThrowingContinuation { continuation in
            /// withCheckedThrowingContinuation ; completion handler st 코드를 async throws 함수로 랩핑
            provider.request(.getCheck(id: id)) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                    ///resume ; 멈춰 있던 async 함수를 다시 실행
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        return try response.map(CheckDTO.self)
    }
}

