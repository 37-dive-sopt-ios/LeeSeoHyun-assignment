//
//  ADImageTableViewCell.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/14/25.
//

import UIKit
import SnapKit

final class ADImageTableViewCell: UITableViewCell {

    static let identifier = "ADImageTableViewCell"

    private let adImages = ["ad1", "ad2", "ad3"]

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        register()
        setDelegate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func register() {
        collectionView.register(ADImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: ADImageCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private func setup() {
        contentView.addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(250) 
        }
    }
}

// MARK: - UICollectionViewDelegate
extension ADImageTableViewCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource
extension ADImageTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return adImages.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ADImageCollectionViewCell.identifier,
            for: indexPath
        ) as? ADImageCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(imageName: adImages[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ADImageTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 250)
    }
}
