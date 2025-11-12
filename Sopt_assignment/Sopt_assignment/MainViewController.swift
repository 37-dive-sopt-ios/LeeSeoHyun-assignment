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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setTableView()
        setLayout()
    }

    private func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }

        tableView.dataSource = self
        tableView.delegate = self

        // 우리가 아까 한 파일에 합쳐둔 컬렉션 셀을 “담는” 테이블셀
        tableView.register(DeliveryCollectionTableViewCell.self,
                           forCellReuseIdentifier: DeliveryCollectionTableViewCell.identifier)
        //tableView.register(MarketCollectionTableViewCell.self, forCellReuseIdentifier: MarketCollectionViewCell.identifier)

        // 나중에 위에 주소/검색바 들어갈 헤더
        tableView.tableHeaderView = HeaderView()
    }

    private func setLayout() {
        // 위에서 이미 constraints 했으니까 여기선 딱히 없음
    }

    /*
    private func makeHeaderView() -> UIView {
        // 여기다가 위에 있는 “우리집 ▼”, 검색바, 배너를 넣으면 돼
        // 우선 높이만 있는 더미로 만들어줄게
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 180))
        header.backgroundColor = .systemGroupedBackground
        return header
    }
     */
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryCollectionTableViewCell.identifier, for: indexPath) as? DeliveryCollectionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(items: deliveryItems)
        return cell
    }
    
    
}
