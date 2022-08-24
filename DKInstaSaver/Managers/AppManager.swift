//
//  AppManager.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class AppManager {
    static let shared: AppManager = AppManager()
    
    var dashboard: DashboardController? {
        (UIApplication.shared.currentKeyWindow?.rootViewController as? UINavigationController)?.topViewController as? DashboardController
    }
    
    func configure() {
        
        applyTheme()
        configureKeyboard()
    }
    
    private func applyTheme() {
        let label = UILabel.appearance()
        label.textColor = .primary
    }
    
    private func configureKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
    
    
}
