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
    
    //MARK: - Media
    func startDownloadMedia() {

        getShortCodeOfPost { [weak self] shortCode in
            guard let self = self else { return }
            guard let shortCode = shortCode, !shortCode.isEmpty else { return }
            self.getPostDetail(shortCode: shortCode)
        }
    }
    
    //MARK: - Story
    func startDownloadStory() {
        DSLog.log()
        
        guard !AppConfig.appId.isEmpty else {
            getAppId { _ in
                self.startDownloadStory()
            }
            return
        }
        
        guard !AppConfig.cookies.isEmpty else {
            self.webView.getCookies { _ in
                self.startDownloadStory()
            }
            return
        }
        
        Task {
            do {
                let user = try await APIManager.getUserDetail(userName: "programmer.pro.dev")
                guard let userId = user.id else { return }
                DSLog.log("userId: \(userId)")

                let stories = try await APIManager.getStories(userId: userId)
                guard !stories.isEmpty else {
                    ProgressHUDManager.showProgress(message: "Story not found")
                    return }
                DSLog.log("stories: \(stories.compactMap({$0.items?.getUrls}))")

            } catch {
                DSLog.log("error: \(error.localizedDescription)")
            }
        }
    }
    
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
    
    func getAppId(completion: ((String)->())? = nil) {

        let script = """
 Array.from(document.scripts).filter(script => script.textContent.includes("X-IG-App-ID"))[0].textContent
 """
        DSLog.log("\(#function) script: \(script)")
        runScript(script: script) { (value: String) in
            let appId = value.slice(from: "X-IG-App-ID\":\"", to: "\"") ?? ""
            DSLog.log("\(#function) appId: \(appId)")
            AppConfig.appId = appId
            completion?(appId)
        }
    }
    
//    func getPageSource(completion: ((String)->())? = nil) {
//        DSLog.log()
//
//        guard let urlPost = "\(APIManager.baseUrlWeb)/p/CfUeC_yLS-_IMk4WfVwoPb3p4H05iJlw5HT7x80/?__a=1&__d=dis".url else { return }
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
    
    func getPostDetail(shortCode: String) {
        DSLog.log("\(#function) shortCode: \(shortCode)")

        guard !AppConfig.cookies.isEmpty else {
            self.webView.getCookies { _ in
                self.getPostDetail(shortCode: shortCode)
            }
            return
        }
        
        APIManager.getMediaDetailAPI(shortCode: shortCode)
            .sink { item in
                self.downloadMedia(post: item)
            }.store(in: &cancellableList)
    }
    
    func downloadMedia(post: Media) {
        let candidate = post.image_versions2?.originalCandidate
        DSLog.log("\(#function) mediaIds: \(post.pk ?? 0), candidate: \(candidate?.toJSONString(prettyPrint: true) ?? "")")
        
        DownloadManager.shared.downloadFile(url: candidate?.url)
    }
}

extension String {

    func slice(from: String, to: String) -> String? {
        guard let rangeFrom = range(of: from)?.upperBound else { return nil }
        guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
        return String(self[rangeFrom..<rangeTo])
    }

}
