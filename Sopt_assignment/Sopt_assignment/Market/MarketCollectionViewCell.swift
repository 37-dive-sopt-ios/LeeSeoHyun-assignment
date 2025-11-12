//
//  MarketCollectionViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

//MARK: - Delegate Protocol

protocol MarketCollectionViewCellDelegate: AnyObject {
    func didTapMarketButton(_ cell: MarketCollectionViewCell)
}

final class MarketCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MarketCollectionViewCell"
    
    //MARK: - Delegate

    weak var delegate: MarketCollectionViewCellDelegate?
    
    //MARK: - UI Components
    
    private let marketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .baeminGray300
        return imageView
    }()
    
    private let marketLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_12
        label.textColor = .baeminGray600
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        contentView.backgroundColor = .systemYellow
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
            marketImageView,
            marketLabel
        )
    }
    
    private func setLayout() {
        marketImageView.snp.makeConstraints {
            $0.size.equalTo(58)
            $0.top.equalTo(contentView).offset(12)
            $0.centerX.equalToSuperview()     
        }
        
        marketLabel.snp.makeConstraints {
            $0.top.equalTo(marketImageView.snp.bottom).offset(6)
            $0.centerX.equalTo(marketImageView)
        }
    }
    
    private func setAddTarget() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
    }
    
    //MARK: - Actions
    
    @objc private func cellTapped() {
        delegate?.didTapMarketButton(self)
    }

    
    //MARK: - Configuration
    
    public func configure(market: MarketModel) {
        marketImageView.image = market.marketImage
        marketLabel.text = market.marketLabel
    }
}
