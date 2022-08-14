//
//  BaseViewController.swift
//  OTTPlatform
//
//  Created by Daksh on 21/02/22.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton?
    @IBOutlet weak var btnMenu: UIButton?
    @IBOutlet weak var lblTitle: UILabel?
    
    deinit {
        DSLog.log(fileName: self.className)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func goBack(from controller: UIViewController) {
        DSLog.log(fileName: self.className)
        
        DispatchQueue.main.async {
            controller.navigationController?.popViewController(animated: true)
        }
    }
    
}
