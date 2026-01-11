//
//  CheckViewController.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import Combine
import UIKit

import Cosmos
import SnapKit
import Then


final class CheckViewController: BaseViewController {

    
    private let viewModel = CheckViewModel()
    private let input: PassthroughSubject<CheckViewModel.Input, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    private let checkButton = UIButton()
    private let checkLabel = UILabel()
    private var ratingView = CosmosView()
    private let saveStarButton = UIButton()
    private var currentRating: Double = 0.0
    
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
        ratingView.do {
            $0.settings.fillMode = .half
            $0.settings.totalStars = 5
            $0.settings.updateOnTouch = true
            $0.settings.starMargin = 5
            $0.settings.starSize = 30
            $0.settings.filledColor = .systemYellow
            $0.settings.emptyBorderColor = .gray
            $0.rating = 0.0
            $0.settings.minTouchRating = 0.5
        }
        saveStarButton.do {
            $0.backgroundColor = .red
            $0.layer.cornerRadius = 10
            $0.setTitle("별점 저장", for: .normal)
        }
    }
    
    override func setLayout() {
        view.addSubviews(checkLabel, checkButton, ratingView, saveStarButton)
        checkButton.addTarget(self, action: #selector(checkButtonTapped(_:)), for: .touchUpInside)
        saveStarButton.addTarget(self, action: #selector(saveStarButtonTapped), for: .touchUpInside)
        
        checkButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
            $0.horizontalEdges.equalToSuperview().inset(60)
            $0.height.equalTo(30)
        }
        checkLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview().inset(60)
        }
        ratingView.snp.makeConstraints {
            $0.top.equalTo(checkLabel).offset(200)
            $0.horizontalEdges.equalTo(ratingView)
            $0.centerX.equalToSuperview()
        }
        saveStarButton.snp.makeConstraints {
            $0.top.equalTo(ratingView).offset(100)
            $0.horizontalEdges.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
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
                case .renderRating(rating: let rating, isButtonEnabled: let isButtonEnabled):
                    self?.ratingView.rating = rating
                    self?.saveStarButton.isEnabled = isButtonEnabled
                }
            }
            .store(in: &cancellables)
    }
    
    @objc
    private func checkButtonTapped(_ sender: Any) {
        input.send(.checkButtonDidTap)
        print("tap")
    }
    
    @objc
    private func saveStarButtonTapped() {
        // CosmosView가 들고 있는 최신 별점(드래그 직후 값)을 우선 사용
        let latest = ratingView.rating
        currentRating = latest
        print("saved rating = \(String(format: "%.1f", currentRating))")
    }
    
    /*
    @objc
    private func checkButtonDidTap() {
        let vc = ManageListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
     */
}
