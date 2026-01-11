//
//  TabBarController.swift
//  Sopt_assignment
//
//  Created by 이서현 on 11/12/25.
//

import UIKit
import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    private func setTabBar() {
        
        view.backgroundColor = .baeminWhite
        
        let mainVC = MainViewController()
        mainVC.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage.icon.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage.icon.withRenderingMode(.alwaysTemplate)
        )
        
        let shoppingVC = ShoppingViewController()
        shoppingVC.tabBarItem = UITabBarItem(
            title: "서버",
            image: UIImage.icon1.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage.icon1.withRenderingMode(.alwaysTemplate)
        )
        
        let bookmarkVC = BookmarkViewController()
        bookmarkVC.tabBarItem = UITabBarItem(
            title: "찜",
            image: UIImage.icon2.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage.icon2.withRenderingMode(.alwaysTemplate)
        )
        
        let orderListVC = OrderListViewController()
        orderListVC.tabBarItem = UITabBarItem(
            title: "주문내역",
            image: UIImage.icon3.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage.icon3.withRenderingMode(.alwaysTemplate)
        )
        
        let myBaeminVC = MyBaeminViewController()
        myBaeminVC.tabBarItem = UITabBarItem(
            title: "마이배민",
            image: UIImage.icon4.withRenderingMode(.alwaysTemplate),
            selectedImage: UIImage.icon4.withRenderingMode(.alwaysTemplate)
        )
        
        self.viewControllers = [mainVC, shoppingVC, bookmarkVC, orderListVC, myBaeminVC]
        
        tabBar.tintColor = .baeminBlack
        tabBar.unselectedItemTintColor = .baeminGray700
    }
}
