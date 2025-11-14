//
//  RankingLabelView.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class RankingLabelView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let infoImageView = UIImageView(image: UIImage(resource: .info))
    private let moreButton = UIButton(configuration: .plain())
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    
    private func setStyle() {
        backgroundColor = .baeminPurple
        layer.cornerRadius = 0
        
        titleLabel.do {
            $0.text = "우리 동네 한그릇 인기 랭킹"
            $0.font = .title_sb_18
            $0.textColor = .white // 배경색 넣게 되면 수정
        }
        
        infoImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        
        moreButton.do {
            $0.configuration?.attributedTitle = AttributedString("전체보기")
            $0.configuration?.attributedTitle?.font = .body_r_14
            $0.configuration?.baseForegroundColor = .white
            $0.configuration?.image = UIImage(systemName: "chevron.right")
            $0.configuration?.preferredSymbolConfigurationForImage = .init(pointSize: 12, weight: .medium)
            $0.configuration?.imagePlacement = .trailing
            $0.configuration?.imagePadding = 4
        }
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        addSubviews(
            titleLabel,
            infoImageView,
            moreButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        infoImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(titleLabel)
            $0.width.height.equalTo(18)
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel)
        }
    }
}

#Preview {
    RankingLabelView()
}
