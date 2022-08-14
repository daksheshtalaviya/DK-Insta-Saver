//
//  DashboardController.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit
import WebKit

class DashboardController : UITabBarController {
  
    lazy var viewModel = DashboardViewModel(self)
    
    var webView: WKWebView? {
        (viewControllers?.first(where: {$0 is HomeController}) as? HomeController)?.webView
    }
    
    enum Tabs: String, CaseIterable {
        case instagram = "Instagram"
        case download = "Download"

        var image: UIImage? {
            switch self {
            case .download: return UIImage(named: "ic_tab_instagram_downloader")
            case .instagram: return UIImage(named: "ic_tab_instagram")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    fileprivate func initialize() {
        DSLog.log()
        
        loadTabs()
    }
    
    fileprivate func loadTabs() {
        DSLog.log()

        self.delegate = self
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .primary
        tabBar.backgroundColor = .black//.withAlphaComponent(0.8)
        
        var controllers: [UIViewController] = []
        Tabs.allCases.forEach { tab in
            let controller: UIViewController

            switch tab {
            case .download:
                controller = DownloadController.instantiateFromNib()
            case .instagram:
                controller = HomeController.instantiateFromNib()
            }
//            
            controller.tabBarItem = UITabBarItem(title: tab.rawValue, image: tab.image, selectedImage: tab.image?.withRenderingMode(.alwaysOriginal))
            if UIApplication.shared.currentKeyWindow?.hasTopNotch == true {
                // Manage display title below the tab icon
                controller.tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
                controller.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
            }
            controllers.append(controller)
        }
        
        self.viewControllers = controllers
    }
    
    
}

extension DashboardController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        DSLog.log("viewController: \(viewController)")

    }
}
