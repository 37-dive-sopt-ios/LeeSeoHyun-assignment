//
//  ManageViewController.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import UIKit

import SnapKit
import Then


final class ManageViewController: BaseViewController {

    private let checkButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUI() {
        checkButton.do {
            $0.backgroundColor = .green
            $0.layer.cornerRadius = 15
            $0.setTitle("입금 완료", for: .normal)
            $0.backgroundColor = .systemBlue
            
            
        }
    }
    
    override func setLayout() {
        checkButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
    }

    func setupBinding() {
        checkButton.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
    }
    
    
    @objc
    private func checkButtonDidTap() {
        let vc = ManageListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
