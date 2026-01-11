//
//  AppDIContainer.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/11/26.
//


final class AppDIContainer {

    static let shared = AppDIContainer()
    private init() {}

    // MARK: - Repository

    private func makeCheckRepository() -> CheckInterface {
        DefaultCheckRepository(service: CheckService())
    }

    // MARK: - UseCase

    private func makeCheckUseCase() -> CheckUseCase {
        DefaultCheckCase(checkRepository: makeCheckRepository())
    }

    // MARK: - ViewModel

    func makeCheckViewModel() -> CheckViewModel {
        CheckViewModel(checkUseCase: makeCheckUseCase())
    }

    func makeCheckViewController() -> CheckViewController {
        CheckViewController(viewModel: makeCheckViewModel())
    }
}
