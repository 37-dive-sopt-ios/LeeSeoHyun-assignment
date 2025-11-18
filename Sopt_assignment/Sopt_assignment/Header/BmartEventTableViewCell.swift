//
//  BmartEventTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//


import UIKit

import SnapKit

final class BmartEventTableViewCell: UITableViewCell {
    static let identifier = "BmartEventTableViewCell"

    private let eventView = BmartEventView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(eventView)
        eventView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
