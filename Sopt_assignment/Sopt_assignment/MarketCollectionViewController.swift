//
//  DeliveryCollectionViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

final class DeliveryCollectionViewController: UIViewController {
    
    //MARK: - Properties
    
    private let lineSpacing: CGFloat = 12
    private let itemSpacing: CGFloat = 10 //?
    private let cellHeight: CGFloat = 78
    private let collectionViewInset: UIEdgeInsets = .init(top: 18, left: 16, bottom: 20, right: 16)
    
    
    //MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectionViewInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var deliveryCollection: [DeliveryModel] = []
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        register()
        setDelegate()
        setLayout()
        loadMockData()
    }
    
    //MARK: - UI Setup
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(cellHeight + collectionViewInset.top + collectionViewInset.bottom)
        }
    }
    
    private func register() {
        collectionView.register(DeliveryCollectionViewCell.self, forCellWithReuseIdentifier: DeliveryCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadMockData() {
        deliveryCollection = DeliveryModel.mockData
        collectionView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension DeliveryCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(deliveryCollection[indexPath.item].categoryLabel) 메뉴 선택됨")
    }
}

//MARK: - UICollectionViewDataSource

extension DeliveryCollectionViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryCollection.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeliveryCollectionViewCell.identifier, for: indexPath) as? DeliveryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.configure(category: deliveryCollection[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension DeliveryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        let width: CGFloat = 62
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
}

//MARK: - RankingCollectionViewCellDelegate


extension DeliveryCollectionViewController: DeliveryCollectionViewCellDelegate {
    func didTapDeliveryButton(_ cell: DeliveryCollectionViewCell) {
        print("tapped")
    }
}
