//
//  TextField+.swift
//  Sopt_assignment
//
//  Created by 이서현 on 10/25/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {self.addSubview($0)}
    }
}
