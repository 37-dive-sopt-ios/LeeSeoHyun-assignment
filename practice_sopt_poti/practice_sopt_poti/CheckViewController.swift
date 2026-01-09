//
//  CheckViewController.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import Combine
import UIKit

import SnapKit
import Then


final class CheckViewController: BaseViewController {

    private let checkButton = UIButton()
    private let checkLabel = UILabel()
    
    private let viewModel = CheckViewModel()
    private let input: PassthroughSubject<CheckViewModel.Input, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        input
            .send(.viewDidAppear)
    }
    
    override func setUI() {
        checkButton.do {
            $0.backgroundColor = .green
            $0.layer.cornerRadius = 15
            $0.setTitle("입금 완료", for: .normal)
            $0.backgroundColor = .systemBlue
        }
        checkLabel.do {
            $0.text = "hi"
            $0.textColor = .blue
            $0.font = .boldSystemFont(ofSize: 20)
            $0.numberOfLines = 2
        }
    }
    
    override func setLayout() {
        view.addSubviews(checkLabel, checkButton)
        checkButton.addTarget(self, action: #selector(checkButtonTapped(_:)), for: .touchUpInside)
        
        checkButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
            $0.horizontalEdges.equalToSuperview().inset(60)
            $0.height.equalTo(30)
        }
        checkLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview().inset(60)
        }
    }
    
    private func bind() {
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        output
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                switch event {
                case .fetchCheckDidSucceed(let state):
                    self?.checkLabel.text = state.title
                case .fetchCheckDidFail(let error):
                    self?.checkLabel.text = error.localizedDescription
                case .enableButton(let isEnabled):
                    self?.checkButton.isEnabled = isEnabled
                }
            }
            .store(in: &cancellables)
    }
    
    @objc
    private func checkButtonTapped(_ sender: Any) {
        input.send(.checkButtonDidTap)
    }

    /*
    @objc
    private func checkButtonDidTap() {
        let vc = ManageListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
     */
}
