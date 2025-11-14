//
//  RankingLabelTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//


// RankingLabelTableViewCell.swift

import UIKit
import SnapKit

final class RankingLabelTableViewCell: UITableViewCell {
    
    static let identifier = "RankingLabelTableViewCell"
    
    private let rankingLabelView = RankingLabelView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        contentView.backgroundColor = .baeminWhite
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(rankingLabelView)
        rankingLabelView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
