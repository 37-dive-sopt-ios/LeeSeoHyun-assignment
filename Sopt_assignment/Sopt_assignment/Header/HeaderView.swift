//
//  HeaderView.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit
import Then

final class HeaderView: UIView {
    
    private let navigationBar = NavigationBar()
    private let searchBarView = SearchBarView()
    private let bmartEventView = BmartEventView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        addSubviews(
            navigationBar,
            searchBarView,
            bmartEventView
        )
    }
    
    private func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(24)
        }
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        //fix 왜 이미지 , 버튼 왼쪽 정렬이 안 될까요..
        bmartEventView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

#Preview {
    HeaderView()
    
}
