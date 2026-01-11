//
//  UIView+.swift
//  practice_sopt_poti
//
//  Created by 이서현 on 1/8/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

