//
//  View+addSubviews().swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//
import UIKit

extension UIScrollView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}


