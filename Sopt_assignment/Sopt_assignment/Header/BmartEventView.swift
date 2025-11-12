//
//  BmartEventView.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/12/25.
//

import Foundation

import UIKit
import SnapKit
import Then

final class BmartEventView: UIView {
    
    private let bMartImage = UIImageView(image: UIImage(resource: .bMart))
    private let bMartEventButton = UIButton(configuration: .plain())
    
    
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
        bMartEventButton.do {
            $0.configuration?.attributedTitle = AttributedString("전상품 쿠폰팩 + 60%특가")
            $0.configuration?.attributedTitle?.font = .head_b_16
            $0.configuration?.baseForegroundColor = .baeminBlack
            $0.configuration?.image = UIImage(systemName: "chevron.right")
            $0.configuration?.preferredSymbolConfigurationForImage = .init(pointSize: 8, weight: .medium) //fix
            $0.configuration?.imagePlacement = .trailing
            $0.configuration?.imagePadding = 2
        }
    }
    
    private func setLayout() {
        addSubviews(
            bMartImage,
            bMartEventButton
        )
        
        bMartImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(16)
        }
        
        bMartEventButton.snp.makeConstraints {
            $0.top.equalTo(bMartImage.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
    }
}

#Preview {
    BmartEventView()
}
