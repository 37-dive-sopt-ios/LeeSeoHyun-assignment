//
//  SegmentedControlTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//


// SegmentedControlTableViewCell.swift

import UIKit
import SnapKit

final class SegmentedControlTableViewCell: UITableViewCell {
    static let identifier = "SegmentedControlTableViewCell"

    private let segmentedBar = SegmentedControlBar()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(segmentedBar)
        segmentedBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(43)
            $0.bottom.equalToSuperview()
        }
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
