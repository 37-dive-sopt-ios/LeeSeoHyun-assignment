//
//  CheckInterface.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/11/26.
//

protocol CheckUseCase {
    func check(id: Int) async throws -> CheckEntity
}
