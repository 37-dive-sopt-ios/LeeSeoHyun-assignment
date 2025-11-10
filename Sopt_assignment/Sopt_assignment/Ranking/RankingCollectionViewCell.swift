//
//  RankingCollectionViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/10/25.
//

import UIKit
import SnapKit

//MARK: - Delegate Protocol

protocol RankingCollectionViewCellDelegate: AnyObject {
    func didTapRankingButton(_ cell: RankingCollectionViewCell)
}

final class RankingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "RankingCollectionViewCell"
    
    //MARK: - Delegate

    weak var delegate: RankingCollectionViewCellDelegate?
    
    //MARK: - UI Components
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .baeminGray300
        return imageView
    }()
    
    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_12
        label.textColor = .baeminGray600
        label.numberOfLines = 1
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_12
        label.textColor = .baeminGray600
        return label
    }()
    
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_12
        label.textColor = .baeminGray600
        return label
    }()
    
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_14
        label.textColor = .baeminBlack
        label.numberOfLines = 1
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = .head_b_14
        label.textColor = .baeminRed
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .head_b_14
        label.textColor = .baeminBlack
        return label
    }()
    
    private let notPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .body_r_12
        label.textColor = .baeminGray600
        return label
    }()
    
    private let leastPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .head_b_13
        label.textColor = .baeminGray600
        return label
    }()
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        // 가게 이름은 너무 길어지면 먼저 줄어들어라 인마
            storeNameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

            // 메뉴 이름 한 줄로, 길면 ... 처리한다
            menuNameLabel.lineBreakMode = .byTruncatingTail
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            foodImageView,
            storeNameLabel,
            starImageView,
            scoreLabel,
            reviewCountLabel,
            menuNameLabel,
            discountLabel,
            priceLabel,
            notPriceLabel,
            leastPriceLabel
        )
    }
    
    private func setLayout() {
        foodImageView.snp.makeConstraints {
            $0.size.equalTo(145)
            $0.top.equalTo(contentView).offset(12)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(foodImageView.snp.bottom).offset(9)
            $0.leading.equalTo(foodImageView)
            $0.trailing.equalTo(starImageView.snp.leading).offset(-5)
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel)
            $0.trailing.equalTo(scoreLabel.snp.leading).offset(-4)
            $0.width.equalTo(11)
            $0.height.equalTo(10)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel)
            $0.trailing.equalTo(reviewCountLabel.snp.leading).offset(-4)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel)
            $0.trailing.equalTo(foodImageView.snp.trailing)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel)
            $0.trailing.lessThanOrEqualTo(foodImageView.snp.trailing)
        }
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(discountLabel)
            $0.leading.equalTo(discountLabel.snp.trailing).offset(6)
        }
        
        notPriceLabel.snp.makeConstraints {
            $0.top.equalTo(discountLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel)
        }
        
        leastPriceLabel.snp.makeConstraints {
            $0.top.equalTo(notPriceLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
    
    private func setAddTarget() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
        contentView.isUserInteractionEnabled = true
    }
    
    //MARK: - Actions
    
    @objc private func cellTapped() {
        delegate?.didTapRankingButton(self)
    }

    
    //MARK: - Configuration
    
    public func configure(rank: FoodModel) {
        
        foodImageView.image = rank.foodImage
        storeNameLabel.text = rank.storeName
        starImageView.image = rank.starImage
        scoreLabel.text = rank.score
        reviewCountLabel.text = rank.reviewCount
        menuNameLabel.text = rank.menuName
        discountLabel.text = rank.discountPercent
        priceLabel.text = rank.price
        notPriceLabel.text = rank.notPrice
        leastPriceLabel.text = rank.leastPrice
    }
}
