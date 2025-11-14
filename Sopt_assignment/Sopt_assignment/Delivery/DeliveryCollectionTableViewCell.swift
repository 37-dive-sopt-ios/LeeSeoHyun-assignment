//
//  DeliveryCollectionTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

final class DeliveryCollectionTableViewCell: UITableViewCell {

    static let identifier = "DeliveryCollectionTableViewCell"

    private let lineSpacing: CGFloat = 12
    private let itemSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 95
    private let collectionViewInset: UIEdgeInsets = .init(top: 18, left: 16, bottom: 20, right: 16)

    private var deliveryCollection: [DeliveryModel] = []

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectionViewInset

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.backgroundColor = .white
        return cv
    }()

    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(collectionView)

        // 2줄 높이 계산 (네가 VC에서 하던 거 그대로)
        let rows: CGFloat = 2
        let height =
            collectionViewInset.top +
            (cellHeight * rows) +
            lineSpacing +
            collectionViewInset.bottom

        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
            $0.bottom.equalToSuperview()   // 셀 높이 잡히게
        }

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DeliveryCollectionViewCell.self,
                                forCellWithReuseIdentifier: DeliveryCollectionViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(items: [DeliveryModel]) {
        self.deliveryCollection = items
        collectionView.reloadData()
    }
}


//MARK: - extension

extension DeliveryCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        deliveryCollection.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DeliveryCollectionViewCell.identifier,
            for: indexPath
        ) as? DeliveryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(category: deliveryCollection[indexPath.item])
        return cell
    }
}

extension DeliveryCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 62, height: cellHeight)
    }
}


