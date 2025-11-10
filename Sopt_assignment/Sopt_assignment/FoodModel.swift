//
//  ChatRoomModel.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/10/25.
//


import UIKit

struct FoodModel {
    let foodImage: UIImage?
    let storeName: String
    let starImage: UIImage?
    let menuName: String
    let score: String
    let reviewCount: String
    let discountPercent: String
    let price: String
    let notPrice: String
    let leastPrice: String
    
    static let mockData: [FoodModel] = [
        FoodModel(foodImage: UIImage(named: "food1"), storeName: "백억보쌈제육쌈밥", starImage: UIImage(named: "star"), menuName: "[든든한 한끼] 보쌈 막국수", score: "5.0", reviewCount: "(1,973)", discountPercent: "25%", price: "12,000원", notPrice: "16,000원", leastPrice: "최소주문금액 없음"),
        FoodModel(foodImage: UIImage(named: "food2"), storeName: "백억보쌈제육쌈밥", starImage: UIImage(named: "star"), menuName: "(1인) 피자 + 사이드 Set", score: "5.0", reviewCount: "(1,973)", discountPercent: "20%", price: "12,000원", notPrice: "16,000원", leastPrice: "최소주문금액 없음"),
        FoodModel(foodImage: UIImage(named: "food3"), storeName: "백억보쌈제육쌈밥", starImage: UIImage(named: "star"), menuName: "[든든한 한끼] 핫치즈 싸이순살]", score: "5.0", reviewCount: "(1,973)", discountPercent: "25%", price: "12,000원", notPrice: "16,000원", leastPrice: "최소주문금액 없음"),
        FoodModel(foodImage: UIImage(named: "food4"), storeName: "맥도날드", starImage: UIImage(named: "star"), menuName: "슈비버거", score: "5.0", reviewCount: "(2,210)", discountPercent: "10%", price: "9,000원", notPrice: "10,000원", leastPrice: "최소주문금액 없음")
        
        //ChatRoomModel(profileImage: UIImage(named: "profile4"), name: "진소은", location: "캐나다", lastMessage: "감사합니다! 조심하가세요~!", thumbnail: UIImage(named: "item10"))
    ]
}
