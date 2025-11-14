//
//  HeaderView.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit

import SnapKit
import Then

final class HeaderView: UITableViewHeaderFooterView {
    
    static let headerViewID = "HeaderView"
    
    private let navigationBar = NavigationBar()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderView()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderView() {
        addSubviews(
            navigationBar
        )
    }
    
    private func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(24)
            $0.bottom.equalToSuperview()
        }
    }
}

