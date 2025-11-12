//
//  MarketCollectionViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

final class MarketCollectionViewController: UIViewController {
    
    //MARK: - Properties
    
    //fix 간격
    private let lineSpacing: CGFloat = 0
    private let itemSpacing: CGFloat = 13 //?
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
    
    private var marketCollection: [MarketModel] = []
    
    
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
            //컬렉션뷰가 화면의 위쪽부터 좌우 전체 폭을 차지
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            //컬렉션뷰 위쪽 + 아래쪽 여백 + 높이
            $0.height.equalTo(cellHeight + collectionViewInset.top + collectionViewInset.bottom)
        }
    }
    
    private func register() {
        collectionView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: MarketCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadMockData() {
        marketCollection = MarketModel.mockData
        collectionView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension MarketCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(marketCollection[indexPath.item].marketLabel) 선택됨")
    }
}

//MARK: - UICollectionViewDataSource

extension MarketCollectionViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marketCollection.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarketCollectionViewCell.identifier, for: indexPath) as? MarketCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.configure(market: marketCollection[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MarketCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        let width: CGFloat = 62
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
}

//MARK: - RankingCollectionViewCellDelegate


extension MarketCollectionViewController: MarketCollectionViewCellDelegate {
    func didTapMarketButton(_ cell: MarketCollectionViewCell) {
        print("tapped")
    }
}
