//
//  DeliveryModel.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/10/25.
//


import UIKit

struct DeliveryModel {
    let categoryImage: UIImage?
    let categoryLabel: String
    
    static let mockData: [DeliveryModel] = [
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "한그릇"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "치킨"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "카페.디저트"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "피자"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "분식"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "고기"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "찜.탕"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "야식"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "패스터푸드"),
        DeliveryModel(categoryImage: UIImage(named: "category1"), categoryLabel: "픽업")
        
    ]
}
