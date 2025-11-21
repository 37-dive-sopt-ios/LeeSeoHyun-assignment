//
//  MarketModel.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/10/25.
//


import UIKit

struct MarketModel {
    let marketImage: UIImage?
    let marketLabel: String
    
    static let mockData: [MarketModel] = [
        MarketModel(marketImage: UIImage(named: "market1"), marketLabel: "B마트"),
        MarketModel(marketImage: UIImage(named: "market1"), marketLabel: "CU"),
        MarketModel(marketImage: UIImage(named: "market1"), marketLabel: "이마트슈퍼"),
        MarketModel(marketImage: UIImage(named: "market1"), marketLabel: "홈플러스"),
        MarketModel(marketImage: UIImage(named: "market1"), marketLabel: "GS25"),
        MarketModel(marketImage: UIImage(named: "market1"), marketLabel: "이마트24")
    ]
}
