//
//  DownloadManager.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import Foundation
import Combine

class DownloadManager {
    
    static let shared: DownloadManager = DownloadManager()
    
    var cancellableList: Set<AnyCancellable> = []

    func downloadMedia(strUrl: String?) throws {
        DSLog.log("\(#function) strUrl: \(strUrl ?? "")")
        guard let strUrl = strUrl?.trim, !strUrl.isEmpty else { throw APIError.invalidUrl }

        guard !AppConfig.cookies.isEmpty else {
            AppManager.shared.dashboard?.webView?.getCookies { _ in
                try? self.downloadMedia(strUrl: strUrl)
            }
            return
        }
        
        APIManager.getMediaDetailAPI(strUrl: strUrl)
            .sink { item in
                self.downloadMedia(post: item)
            }.store(in: &cancellableList)
    }
    
    func downloadMedia(post: Media) {
        var strUrl: String?
        
        switch post.media_type {
        case .image:
            strUrl = post.image_versions2?.originalCandidate?.url
            break
        case .video:
            strUrl = post.originalVideoVersion?.url
            break
        default:
            break
        }
        
        DSLog.log("\(#function) strUrl: \(strUrl ?? "")")
        
        downloadFile(url: strUrl)
    }
    
    func downloadFile(url: String?) {
        DSLog.log("\(#function) url: \(url ?? "")")
        
        guard let url = url?.url else {
            DSLog.log("\(#function) url not valid.")
            ProgressHUDManager.showProgress(message: "\(url ?? "N/A") url is not valid")
            return }
        URLSession.shared.downloadTask(with: url) { urlFilePath, urlResponse, error in
            DSLog.log("\(#function) urlResponse: \(urlResponse.debugDescription)")
            if let error = error {
                DSLog.log("\(#function) error: \(error.localizedDescription)")
                ProgressHUDManager.showProgress(message: "Download media error: \(error.localizedDescription)")
            } else if let tempPath = urlFilePath {
                DSLog.log("\(#function) tempPath: \(tempPath.path)")
                StorageManager.shared.saveFile(fromPath: tempPath, fileName: url.lastPathComponent)
            } else {
                DSLog.log("\(#function) something went wrong!!")
                ProgressHUDManager.showProgress(message: nil)
            }
        }.resume()
    }
}
