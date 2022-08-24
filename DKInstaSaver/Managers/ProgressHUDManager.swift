//
//  ProgressHUDManager.swift
//  DKInstaSaver
//
//  Created by Dksh on 13/08/22.
//

import Foundation
import KRProgressHUD

class ProgressHUDManager {
    
    enum MessageType : Int {
        case normal
        case success
        case error
        case warning
        case info
    }
    
    static func showProgress(message: String? = nil, type: MessageType = .error) {
        DispatchQueue.main.async {
            if let message = message {
                
                KRProgressHUD.set(deadline: 2.0)
                
                switch type {
                case .success:
                    KRProgressHUD.showSuccess(withMessage: message)
                    break
                case .error:
                    KRProgressHUD.showError(withMessage: message)
                    break
                case .warning:
                    KRProgressHUD.showWarning(withMessage: message)
                    break
                case .info:
                    KRProgressHUD.showInfo(withMessage: message)
                    break
                default:
                    KRProgressHUD.showMessage(message)
                }
                return
            }
            
            KRProgressHUD.show()
        }
    }
    
    static func dismissProgress() {
        DispatchQueue.main.async {
            KRProgressHUD.dismiss(nil)
        }
    }
}
