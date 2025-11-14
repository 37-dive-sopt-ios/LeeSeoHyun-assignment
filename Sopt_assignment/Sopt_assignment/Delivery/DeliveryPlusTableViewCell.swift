//
//  DeliveryPlusTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class DeliveryPlusTableViewCell: UITableViewCell {
    static let identifier = "DeliveryPlusTableViewCell"
    
    private let deliveryPlusLabelButton = UIButton(configuration: .plain())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        deliveryPlusLabelButton.do {
            $0.configuration?.attributedTitle = AttributedString("음식배달에서 더보기")
            $0.configuration?.attributedTitle?.font = .head_b_16
            $0.configuration?.baseForegroundColor = .baeminBlack
            $0.configuration?.image = UIImage(systemName: "chevron.right")
            $0.configuration?.preferredSymbolConfigurationForImage = .init(pointSize: 8, weight: .medium)
            $0.configuration?.imagePlacement = .trailing
            $0.configuration?.imagePadding = 2
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(
            deliveryPlusLabelButton
        )
        
        deliveryPlusLabelButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

#Preview {
    DeliveryPlusTableViewCell()
}
