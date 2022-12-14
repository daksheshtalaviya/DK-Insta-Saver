//
//  HomeController+MediaDownloader.swift
//  DKInstaSaver
//
//  Created by Dksh on 07/08/22.
//

import Foundation
import UIKit

extension HomeController {
    
    func openMediaAlert() {

        let alertController = UIAlertController(title: "Download Media", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Download", style: .destructive, handler: { action in
            self.startDownloadMedia()
        }))
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func startDownloadMedia() {
//        downloadImage()
//        downloadAllTypesOfMedia()
//        getPageSource(completion: nil)
        
        getShortCodeOfPost { [weak self] shortCode in
            guard let self = self else { return }
            guard let shortCode = shortCode, !shortCode.isEmpty else { return }
            self.getPostDetail(shortCode: shortCode)
        }
    }
    
//    func downloadAllTypesOfMedia() {
//
//        guard !AppConfig.appId.isEmpty else {
//            getAppId { _ in
//                self.downloadAllTypesOfMedia()
//            }
//            return
//        }
//
//        getMediaId { mediaId in
//            self.getMediaInfoAPI(mediaId: mediaId)
//        }
//    }
    
    func getCurrentURL(completion: ((String?)->())? = nil) {
        let script = "window.location.href"
        DSLog.log("\(#function) script: \(script)")
        
        runScript(script: script) { (url: String) in
            DSLog.log("\(#function) url: \(url)")
            completion?(url)
        }
    }
    
    func getShortCodeOfPost(completion: ((String?)->())? = nil) {

        getCurrentURL { url in
            let shortCode = String(url?.split(separator: "/").last ?? "")
            DSLog.log("\(#function) shortCode: \(shortCode)")
            completion?(shortCode)
        }
    }
    
//    func getAppId(completion: ((String)->())? = nil) {
//
//        let script = """
// Array.from(document.scripts).filter(script => script.textContent.includes("X-IG-App-ID"))[0].textContent
// """
//        DSLog.log("\(#function) script: \(script)")
//        runScript(script: script) { (value: String) in
//            let appId = value.slice(from: "X-IG-App-ID\":\"", to: "\"") ?? ""
//            DSLog.log("\(#function) appId: \(appId)")
//            AppConfig.appId = appId
//            completion?(appId)
//        }
//    }
    
//    func getPageSource(completion: ((String)->())? = nil) {
//        DSLog.log()
//
//        guard let urlPost = "https://www.instagram.com/p/CfUeC_yLS-_IMk4WfVwoPb3p4H05iJlw5HT7x80/?__a=1&__d=dis".url else { return }
//        do {
//            let data = try Data(contentsOf: urlPost)
//            let strPage = String(data: data, encoding: .utf8)
//            DSLog.log("strPage: \(strPage ?? "")")
//        } catch {
//            DSLog.log("error: \(error)")
//        }
//    }
    
//    func getMediaId(completion: ((String)->())? = nil) {
//
//        let script = """
//        document.querySelector('[property="al:ios:url"]').content
// """
//        DSLog.log("\(#function) script: \(script)")
//        runScript(script: script) { (value: String) in
//            DSLog.log("\(#function) value: \(value)")
//            completion?(value)
//        }
//    }
    
    func downloadMedia(url: String?) {
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

extension HomeController {
    
    func getCookies(completion: ((Any?)->())? = nil) {
        DSLog.log("\(#function)")

        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            
            let headers = cookies.compactMap { cookie in
                return "\(cookie.name)=\(cookie.value)"
            }
            DSLog.log("headers: \(headers)")
            
            AppConfig.cookies = headers.joined(separator: ";")
            
            completion?(headers)
        }
    }
    
}

extension HomeController {
    //MARK: - Scripts
    
    func runScript<T>(script: String, completion: ((T)->())? = nil) {
        DSLog.log("\(#function) script: \(script)")
        
        webView.getContents(script: script)
            .sink { result in
                switch result {
                case .failure(let error):
                    DSLog.log("\(#function) error: \(error.localizedDescription)")
                case .finished:
                    DSLog.log("\(#function) finished.")
                }
            } receiveValue: { value in
                DSLog.log("\(#function) value: \(value.debugDescription)")
                guard let value = value as? T else {
                    DSLog.log("\(#function) value not found")
                    return }
                completion?(value)
            }
            .store(in: &cancellableList)
        
    }
    
}

extension HomeController {
    //MARK: - API Services
    
//    func getMediaInfo(mediaUrl: String) {
//        DSLog.log("\(#function) mediaUrl: \(mediaUrl)")
//
//        guard !AppConfig.cookies.isEmpty else {
//            getCookies { _ in
//                self.getMediaInfo(mediaUrl: mediaUrl)
//            }
//            return
//        }
//
//        getMediaInfoAPI(mediaId: "2898915245954059380")
//
//    }
    
    func getPostDetail(shortCode: String) {
        DSLog.log("\(#function) shortCode: \(shortCode)")

        guard !AppConfig.cookies.isEmpty else {
            getCookies { _ in
                self.getPostDetail(shortCode: shortCode)
            }
            return
        }
        
        getPostDetailAPI(shortCode: shortCode)
            .sink { item in
                self.downloadMedia(post: item)
            }.store(in: &cancellableList)
    }
    
    func downloadMedia(post: Post) {
        let candidate = post.image_versions2?.originalCandidate
        DSLog.log("\(#function) mediaIds: \(post.pk ?? 0), candidate: \(candidate?.toJSONString(prettyPrint: true) ?? "")")
        
        downloadMedia(url: candidate?.url)
    }
}

//extension String {
//
//    func slice(from: String, to: String) -> String? {
//        guard let rangeFrom = range(of: from)?.upperBound else { return nil }
//        guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
//        return String(self[rangeFrom..<rangeTo])
//    }
//
//}
