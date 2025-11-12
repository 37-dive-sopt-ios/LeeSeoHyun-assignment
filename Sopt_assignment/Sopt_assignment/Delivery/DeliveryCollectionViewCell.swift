//
//  DeliveryCollectionViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

//MARK: - Delegate Protocol

protocol DeliveryCollectionViewCellDelegate: AnyObject {
    func didTapDeliveryButton(_ cell: DeliveryCollectionViewCell)
}

final class DeliveryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "DeliveryCollectionViewCell"
    
    //MARK: - Delegate

    weak var delegate: DeliveryCollectionViewCellDelegate?
    
    //MARK: - UI Components
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .baeminGray300
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_12
        label.textColor = .baeminGray600
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI & Layout
    
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            foodImageView,
            categoryLabel
        )
    }
    
    private func setLayout() {
        foodImageView.snp.makeConstraints {
            $0.size.equalTo(58)
            $0.top.equalTo(contentView).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(foodImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
    }
    
    //MARK: - Actions
    
    @objc private func cellTapped() {
        delegate?.didTapDeliveryButton(self)
    }

    
    //MARK: - Configuration
    
    public func configure(category: DeliveryModel) {
        foodImageView.image = category.categoryImage
        categoryLabel.text = category.categoryLabel

    }
}
