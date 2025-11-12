//
//  NavigationBar.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/12/25.
//

import UIKit
import SnapKit
import Then

final class NavigationBar: UIView {
    
    private let selectLocationButton = UIButton(configuration: .plain())
    private let discountButton = UIButton()
    private let alarmButton = UIButton()
    private let cartButton = UIButton()
    
    var titleLabel = AttributedString("우리집")
    
    //MARK: - lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        selectLocationButton.do {
            $0.configuration?.attributedTitle = AttributedString("우리집")
            $0.configuration?.attributedTitle?.font = .head_b_16
            $0.configuration?.baseForegroundColor = .baeminBlack
            $0.configuration?.image = .polygon
            $0.configuration?.imagePlacement = .trailing
            $0.configuration?.imagePadding = 3

        }
        
        discountButton.do {
            $0.setImage(.baeminDiscount, for: .normal)
        }
        
        alarmButton.do {
            $0.setImage(.alarm, for: .normal)
        }
        
        cartButton.do {
            $0.setImage(.cart, for: .normal)
        }
    }
    
    private func setHierarchy() {
        addSubviews(
            selectLocationButton,
            discountButton,
            alarmButton,
            cartButton
        )
    }
    
    private func setLayout() {
        
        selectLocationButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(selectLocationButton)
            $0.size.equalTo(24)
        }
        
        alarmButton.snp.makeConstraints {
            $0.trailing.equalTo(cartButton.snp.leading).offset(-12)
            $0.top.equalTo(selectLocationButton)
            $0.size.equalTo(24)
        }
        
        discountButton.snp.makeConstraints {
            $0.trailing.equalTo(alarmButton.snp.leading).offset(-12)
            $0.top.equalTo(alarmButton)
            $0.size.equalTo(24)
        }
    }
}
