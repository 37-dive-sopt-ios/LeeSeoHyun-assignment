//
//  MarketCollectionTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/13/25.
//

import UIKit
import SnapKit

final class MarketCollectionTableViewCell: UITableViewCell {
    
    static let identifier = "MarketCollectionTableViewCell"
    
    private let lineSpacing: CGFloat = 13
    private let itemSpacing: CGFloat = 13 //얜 horizontal이면 필요x?
    private let cellHeight: CGFloat = 90
    private let collectionViewInset: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
    
    private var marketCollection: [MarketModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectionViewInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        
        let height = collectionViewInset.top + cellHeight + collectionViewInset.bottom
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
            $0.bottom.equalToSuperview()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: MarketCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not benen implemented")
    }
    
    func configure(items: [MarketModel]) {
        self.marketCollection = items
        collectionView.reloadData()
    }
    
}

//MARK: - extension

extension MarketCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        marketCollection.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketCollectionViewCell.identifier, for: indexPath) as? MarketCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(market: marketCollection[indexPath.row])
        return cell
    }
}

extension MarketCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 62, height: cellHeight)
    }
}
