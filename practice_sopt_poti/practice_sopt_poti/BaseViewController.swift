//
//  BaseViewController.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Override
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - SetUp
    func setUI() {}
    func setLayout() {}
}
