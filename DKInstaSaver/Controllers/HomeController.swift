//
//  HomeController.swift
//  WhatsAppWeb
//
//  Created by Dksh on 11/06/22.
//

import UIKit
import WebKit
import Combine



class HomeController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var btnCount: UIButton!
    @IBOutlet var btnRefresh: UIButton!

    var txtAlert: UITextField?
    var cancellableList: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       initialize()
    }
    
    private func initialize() {
        
        configure()
        configureButtons()
    }
    
    private func configure() {
        
        webView.configuration.mediaTypesRequiringUserActionForPlayback = .all
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)

        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"
        webView.navigationDelegate = self
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        loadUrl()
    }
    
    private func configureButtons() {
        
        btnRefresh.addAction(UIAction(handler: { sender in
            self.refreshPage()
        }), for: .touchUpInside)
        
        btnCount.addAction(UIAction(handler: { sender in
            self.openMediaAlert()
        }), for: .touchUpInside)
    }
    
    private func loadUrl(strUrl: String? = instagramUrl) {
        guard let url = strUrl?.url else { return }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
    }
    
    private func refreshPage() {
        DSLog.log()
     
        getCurrentURL { [weak self] url in
            self?.loadUrl(strUrl: url)
        }
    }
}

extension HomeController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            DSLog.log("estimatedProgress: \(webView.estimatedProgress)")
        }
    }
}

extension HomeController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        let url = webView.url?.absoluteString
        DSLog.log("url: \(url.default())")
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = webView.url?.absoluteString
        DSLog.log("url: \(url.default())")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        let url = webView.url?.absoluteString
        DSLog.log("url: \(url.default())")
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let url = webView.url?.absoluteString
        DSLog.log("url: \(url.default())")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy {
        //        let url = webView.url?.absoluteString
        DSLog.log("url: \((navigationResponse.response.url?.absoluteString).default())")
        
        return .allow
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        let url = navigationAction.request.url
        DSLog.log("url: \((url?.absoluteString).default())")
        
        if url?.absoluteString == "https://www.instagram.com/" {
//            webView.load(scheme.authenticationURlRequest)
            return .allow
        }
        
        if navigationAction.navigationType == .linkActivated,
           let url = url,
           UIApplication.shared.canOpenURL(url) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url)
            }
        }
        return .allow
    }
}

extension HomeController {
   //MARK: - Add Script
    
    func getTextByScript(script: String, completion: ((Any?)->())? = nil) {
        DSLog.log("script: \(script)")
        
        webView.evaluateJavaScript(script) { result, error in
            DSLog.log("result: \(result.debugDescription), error: \(error.debugDescription)")
            completion?(result)
        }
    }
}
