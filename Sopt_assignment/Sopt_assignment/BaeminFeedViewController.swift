//
//  BaeminFeedViewController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/11/25.
//

import UIKit
import SnapKit

class BaeminFeedViewController: UIViewController {
    
    private let segmentedBar = SegmentedControlBar()
    
    private let deliveryView = UIView()
    private let pickupView = UIView()
    private let shoppingView = UIView()
    private let giftView = UIView()
    private let groupEventView = UIView()
    
    private lazy var categoryViews = [deliveryView, pickupView, shoppingView, giftView, groupEventView]
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        
    }
    
    
    //MARK: - UI Setup

    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        self.view.addSubviews(
            deliveryView,
            pickupView,
            shoppingView,
            giftView,
            groupEventView)
    }

    //FIXME: - 레이아웃

    private func setLayout() {
        segmentedBar.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        categoryViews.forEach {
            $0.snp.makeConstraints {
                $0.top.equalTo(segmentedBar).offset(30)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
}
