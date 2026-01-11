//
//  RankingCollectionTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//

import UIKit
import SnapKit

final class RankingCollectionTableViewCell: UITableViewCell {
    
    static let identifier = "RankingCollectionTableViewCell"
    
    // MARK: - Properties
    
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 280
    private let collectionViewInset = UIEdgeInsets(top: 18, left: 16, bottom: 20, right: 16)
    
    private var rankingCollection: [FoodModel] = []
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectionViewInset
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .white
        collectionview.showsHorizontalScrollIndicator = false
        return collectionview
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(items: [FoodModel]) {
        rankingCollection = items
        collectionView.reloadData()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .white
    }
    
    private func setupLayout() {
        contentView.addSubview(collectionView)
        
        let height = cellHeight + collectionViewInset.top + collectionViewInset.bottom
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
            $0.bottom.equalToSuperview() 
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            RankingCollectionViewCell.self,
            forCellWithReuseIdentifier: RankingCollectionViewCell.identifier
        )
    }
}

// MARK: - UICollectionViewDataSource

extension RankingCollectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return rankingCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RankingCollectionViewCell.identifier,
            for: indexPath
        ) as? RankingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.configure(rank: rankingCollection[indexPath.item])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RankingCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: cellHeight)
    }
}

// MARK: - RankingCollectionViewCellDelegate

extension RankingCollectionTableViewCell: RankingCollectionViewCellDelegate {
    func didTapRankingButton(_ cell: RankingCollectionViewCell) {
        print("랭킹 셀 탭됨")
    }
}
