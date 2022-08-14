//
//  DownloadController.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit

class DownloadController: BaseViewController {

    @IBOutlet var txtLink: UITextField!
    @IBOutlet var txtUserName: UITextField!

    @IBOutlet var btnDownload: UIButton!
    @IBOutlet var btnSearch: UIButton!

    lazy var viewModel: DownloadViewModel = DownloadViewModel(controller: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       initialize()
    }
    
    private func initialize() {
        
        lblTitle?.text = tabBarItem.title
        
        configureButtons()
    }
    
    private func configureButtons() {
        
        btnDownload.addAction(UIAction(handler: { sender in
            self.viewModel.downloadMedia(link: self.txtLink.text)
        }), for: .touchUpInside)
        
        btnSearch.addAction(UIAction(handler: { sender in

        }), for: .touchUpInside)
    }
    
}
