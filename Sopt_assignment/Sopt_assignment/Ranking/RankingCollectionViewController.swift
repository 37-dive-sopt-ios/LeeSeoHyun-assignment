//
//  RankingCollectionViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/10/25.
//

import UIKit
import SnapKit

final class RankingCollectionViewController: UIViewController {
    
    //MARK: - Properties
    
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 243
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

    private var rankingCollection: [FoodModel] = []

    
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
        collectionView.register(RankingCollectionViewCell.self, forCellWithReuseIdentifier: RankingCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadMockData() {
        rankingCollection = FoodModel.mockData
        collectionView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension RankingCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(rankingCollection[indexPath.item].menuName) 메뉴 선택됨")
    }
}

//MARK: - UICollectionViewDataSource

extension RankingCollectionViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankingCollection.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as? RankingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.configure(rank: rankingCollection[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension RankingCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        let width: CGFloat = 145
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
}

//MARK: - RankingCollectionViewCellDelegate


extension RankingCollectionViewController: RankingCollectionViewCellDelegate {
    
    func didTapRankingButton(_ cell: RankingCollectionViewCell) {
        print("tapped")
    }
}
