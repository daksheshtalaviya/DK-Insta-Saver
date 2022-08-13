//
//  HomeController+APIServices.swift
//  DKInstaSaver
//
//  Created by Dksh on 07/08/22.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Combine

extension HomeController {
    
    func getPostDetailAPI(shortCode: String) -> Future<Post, Never> {
        DSLog.log("\(#function) shortCode: \(shortCode)")
        
        return Future { promise in
            guard let url: URL = "https://www.instagram.com/p/\(shortCode)/?__a=1&__d=dis".url else { return }
            var request: URLRequest = URLRequest(url: url)
            request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")

            AF.request(request)
                .responseArray(keyPath: "items",
                               completionHandler: { (response: DataResponse<[Post], AFError>) in
                     switch response.result {
                    case .success(let items):
                        do {
                            DSLog.log("items: \(items.count)")

                            if let item = items.first {
                                promise(.success(item))
                            }
                        }
                        break
                    case .failure(let error):
                         DSLog.log("error: \(error)")

                         if 400...499 ~= (response.response?.statusCode ?? 0) {
                             ProgressHUDManager.showProgress(message: "Post not found or Authentication failed")
                         } else {
                             ProgressHUDManager.showProgress(message: "API error: \(error.localizedDescription)")
                         }
                    }
                })
        }
    }
    
    func getMediaInfoAPI(mediaId: String) {
        DSLog.log("\(#function) mediaId: \(mediaId)")
        guard let url: URL = "https://i.instagram.com/api/v1/media/\(mediaId)/info/".url else { return }
        var request: URLRequest = URLRequest(url: url)
        request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")
        request.addValue(AppConfig.appId, forHTTPHeaderField: "X-IG-App-ID")

        AF.request(request).responseJSON { response in
            DSLog.log("\(#function) response: \(response)")
//            switch response {
//
//            default:
//                <#code#>
//            }
        }
        
//        return Future { promise in
//
//        }
    }
}
