//
//  RankingTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/10/25.
//

import UIKit
import SnapKit

final class RankingTableViewCell: UITableViewCell {
    
    static let identifier: String = "RankingTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI & Layout
    
    private func setUI() {
        selectionStyle = .none //fix ; selectionStyle?
        backgroundColor = .white
    }
    
    //contentView는 UITableViewCell의 ‘root view’ 역할을 하는 전용 컨테이너
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
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel)
            $0.leading.equalTo(storeNameLabel.snp.trailing).offset(5)
            $0.width.equalTo(11)
            $0.height.equalTo(10)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel)
            $0.leading.equalTo(starImageView.snp.trailing).offset(2)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel)
            $0.leading.equalTo(scoreLabel.snp.trailing).offset(4)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel)
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
}


#Preview {
    RankingTableViewCell()
}
