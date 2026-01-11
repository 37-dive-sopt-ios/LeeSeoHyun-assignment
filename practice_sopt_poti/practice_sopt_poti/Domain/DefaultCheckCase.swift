//
//  DefaultCheckCase.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/11/26.
//

struct DefaultCheckCase: CheckUseCase {
    
    private let checkRepository: CheckInterface
    
    init(checkRepository: CheckInterface) {
        self.checkRepository = checkRepository
    }
    
    func check(id: Int) async throws -> CheckEntity {
        
        return try await checkRepository.check(id: id)
    }
}
