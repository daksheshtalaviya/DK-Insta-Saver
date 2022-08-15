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
        txtUserName.text = "daksh_talaviya_27"
        
        configureButtons()
    }
    
    private func configureButtons() {
        
        btnDownload.addAction(UIAction(handler: { sender in
            self.viewModel.downloadMedia(link: self.txtLink.text)
        }), for: .touchUpInside)
        
        btnSearch.addAction(UIAction(handler: { sender in
            Task {
                guard let user = try? await self.viewModel.getUser(userName: self.txtUserName.text) else { return }
                self.openUserDetailPage(user: user)
            }
        }), for: .touchUpInside)
    }
    
}

extension DownloadController {
    
    private func openUserDetailPage(user: User) {
        DSLog.log()
        
        let controller: UserDetailController = UserDetailController.instantiateFromNib()
        controller.user = user
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
