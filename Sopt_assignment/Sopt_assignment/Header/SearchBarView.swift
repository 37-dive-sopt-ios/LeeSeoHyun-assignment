//
//  SearchBarView.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit
import Then

final class SearchBarView: UIView {
    
    private let searchBar = UITextField()
    private let searchButton = UIButton()
    
    
    //MARK: - lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        searchBar.do {
            $0.placeholder = "찾아라! 맛있는 음식과 맛집"
            $0.textColor = .baeminGray700
            $0.font = .body_r_14
            $0.borderStyle = .none
            $0.layer.borderColor = UIColor.baeminGray700.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 18
            $0.addLeftPadding()
            $0.addRightPadding()
        }
        
        searchButton.do {
            $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            $0.tintColor = .baeminBlack
        }
    }
    
    private func setLayout() {
        addSubviews(
            searchBar,
            searchButton
        )
        
        searchBar.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.trailing.equalTo(searchBar).offset(-17)
            $0.centerY.equalTo(searchBar)
            $0.size.equalTo(24)
        }
    }
}

#Preview {
    SearchBarView()
}
