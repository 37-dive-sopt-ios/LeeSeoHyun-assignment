//
//  MainViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

// MainViewController.swift

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let deliveryItems: [DeliveryModel] = DeliveryModel.mockData
    private let marketItems: [MarketModel] = MarketModel.mockData
    private let rankingItems: [FoodModel] = FoodModel.mockData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setTableView()
        setLayout()
    }

    private func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview()
        }

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0

        // 우리가 아까 한 파일에 합쳐둔 컬렉션 셀을 “담는” 테이블셀
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.headerViewID)
        tableView.register(
            BmartEventTableViewCell.self,
            forCellReuseIdentifier: BmartEventTableViewCell.identifier
        )
        tableView.register(SegmentedControlTableViewCell.self,
                           forCellReuseIdentifier: SegmentedControlTableViewCell.identifier)
        tableView.register(DeliveryPlusTableViewCell.self,
                           forCellReuseIdentifier: DeliveryPlusTableViewCell.identifier)
        tableView.register(DeliveryCollectionTableViewCell.self,
                           forCellReuseIdentifier: DeliveryCollectionTableViewCell.identifier)
        tableView.register(MarketCollectionTableViewCell.self, forCellReuseIdentifier: MarketCollectionTableViewCell.identifier)
        tableView.register(ADImageTableViewCell.self,
                           forCellReuseIdentifier: ADImageTableViewCell.identifier)
        tableView.register(RankingLabelTableViewCell.self,
                               forCellReuseIdentifier: RankingLabelTableViewCell.identifier)
        tableView.register(RankingCollectionTableViewCell.self,
                           forCellReuseIdentifier: RankingCollectionTableViewCell.identifier)


        let header = HeaderView()
        header.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 30)
        
        tableView.tableHeaderView = header
        
    }

    private func setLayout() {
        // 위에서 이미 constraints 했으니까 여기선 딱히 없음
    }
}


extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBarView = SearchBarView()
        searchBarView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        return searchBarView
    }
    
    func tableView(_ tableView: UITableView,
                       heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.row {
            case 0:    // BmartEventTableViewCell
                return 70
            case 1:    // SegmentedControlTableViewCell
                return 70
            case 2:    // DeliveryCollectionTableViewCell
                return 250
            case 3:    // DeliveryPlusTableViewCell
                return 20
            case 4:    // MarketCollectionTableViewCell
                return 120
            case 5:    // ADImageTableViewCell
                return 330
            case 6:
                return 70
            case 7:
                return 280
            default:
                return 44
            }
        }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BmartEventTableViewCell.identifier, for: indexPath) as? BmartEventTableViewCell else {
                
                return UITableViewCell()
            }
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SegmentedControlTableViewCell.identifier,
                for: indexPath
            ) as? SegmentedControlTableViewCell else {
                
                return UITableViewCell()
            }
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryCollectionTableViewCell.identifier, for: indexPath) as? DeliveryCollectionTableViewCell else {
                
                return UITableViewCell()
            }
            
            cell.configure(items: deliveryItems)
            
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryPlusTableViewCell.identifier, for: indexPath) as? DeliveryPlusTableViewCell else {
                
                return UITableViewCell()
            }
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketCollectionTableViewCell    .identifier, for: indexPath) as? MarketCollectionTableViewCell else {
                
                return UITableViewCell()
            }
            
            cell.configure(items: marketItems)
            
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ADImageTableViewCell.identifier, for: indexPath) as? ADImageTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RankingLabelTableViewCell.identifier,
                for: indexPath
            ) as? RankingLabelTableViewCell else {
                
                return UITableViewCell()
            }
            
            return cell
            
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingCollectionTableViewCell.identifier, for: indexPath) as? RankingCollectionTableViewCell else {
                
                return UITableViewCell()
            }
            
            cell.configure(items: rankingItems)
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
