//
//  UISegmentedControl+Extensions.swift
//  DKInstaSaver
//
//  Created by Dksh on 15/08/22.
//

import UIKit

extension UISegmentedControl {
    
    func setTitleColor(color: UIColor, for state: UIControl.State = .normal) {
        let fontAttribute: [NSAttributedString.Key : Any] = [
            .foregroundColor: color
        ]
        
        self.setTitleTextAttributes(fontAttribute, for: state)
    }
}
