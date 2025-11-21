//
//  ADimageCollectionViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//

import UIKit
import SnapKit

protocol ADImageTableViewCellDelegate: AnyObject {
    func didTapADImageButton(_ cell: ADImageCollectionViewCell)
}

final class ADImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "ADImageCollectionViewCell"

    private let adImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        adImageView.contentMode = .scaleAspectFill
        adImageView.layer.cornerRadius = 0

        contentView.addSubview(adImageView)
        adImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(250) 
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(imageName: String) {
        adImageView.image = UIImage(named: imageName)
    }
}
