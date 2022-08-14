//
//  DownloadViewModel.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import Foundation

class DownloadViewModel {
    
    let controller: DownloadController
    
    init(controller: DownloadController) {
        self.controller = controller
    }
    
    func downloadMedia(link: String?) {
        DSLog.log("link: \(link ?? "")")
        
        do {
            let url = try addParametersTo(link: link)
            try DownloadManager.shared.downloadMedia(strUrl: url.absoluteString)
        } catch {
            ProgressHUDManager.showProgress(message: "\(link ?? "N/A") url is not valid")
        }
    }
    
    private func addParametersTo(link: String?) throws -> URL {
        DSLog.log("link: \(link ?? "")")
        
        guard let link = link?.trim,
              var urlComp = URLComponents(string: link) else { throw APIError.invalidUrl }
        
        let newParam: [String : String] = [
            "__a" : "1",
            "__d" : "dis"
        ]
        
        newParam.forEach { (key, value) in
            urlComp.queryItems?.append(URLQueryItem(name: key, value: value))
        }
        
        DSLog.log("url: \(urlComp.url?.absoluteString ?? "")")
        guard let url = urlComp.url else { throw APIError.invalidUrl }
        return url
    }
    
}

extension DownloadViewModel {
    
}
