//
//  DefaultCheckRepository.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/11/26.
//

import Foundation

final class DefaultCheckRepository: CheckInterface {

    private let service: CheckServiceType

    init(service: CheckServiceType = CheckService()) {
        self.service = service
    }

    func check(id: Int) async throws -> CheckEntity {
        let dto = try await service.getCheckTitle(id: id)
        return CheckEntity(
            userId: dto.userId,
            id: dto.id,
            title: dto.title,
            body: dto.body
        )
    }
}
