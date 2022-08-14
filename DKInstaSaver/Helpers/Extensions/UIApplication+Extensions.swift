//
//  UIApplication+Extensions.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit

extension UIApplication {
    
    var currentKeyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return windows.first { $0.isKeyWindow }
        } else {
            return keyWindow
        }
    }
}
