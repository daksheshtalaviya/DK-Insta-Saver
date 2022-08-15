//
//  APIManager+Services.swift
//  DKInstaSaver
//
//  Created by Dksh on 13/08/22.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Combine

extension APIManager {
    
    static func getMediaDetailAPI(strUrl: String) -> Future<Media, Never> {
        DSLog.log("\(#function) strUrl: \(strUrl)")
        
        return Future { promise in
            guard let url: URL = strUrl.url else { return }
            var request: URLRequest = URLRequest(url: url)
            request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")

            getMediaDetailAPIRequest(request: request, promise: promise)
        }
    }
    
    static func getMediaDetailAPI(shortCode: String) -> Future<Media, Never> {
        DSLog.log("\(#function) shortCode: \(shortCode)")
        
        return Future { promise in
            guard let url: URL = "https://www.instagram.com/p/\(shortCode)/?__a=1&__d=dis".url else { return }
            var request: URLRequest = URLRequest(url: url)
            request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")
            
            getMediaDetailAPIRequest(request: request, promise: promise)
        }
    }
    
    static func getMediaInfoAPI(mediaId: String) -> Future<Media, Never> {
        DSLog.log("\(#function) mediaId: \(mediaId)")
        
        return Future { promise in
            guard let url: URL = "https://i.instagram.com/api/v1/media/\(mediaId)/info/".url else { return }
            var request: URLRequest = URLRequest(url: url)
            request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")
            request.addValue(AppConfig.appId, forHTTPHeaderField: "X-IG-App-ID")
            
            getMediaDetailAPIRequest(request: request, promise: promise)
        }
    }
    
    static func getMediaDetailAPIRequest(request: URLRequest, promise: ((Result<Media, Never>) -> Void)? = nil) {
        DSLog.log("\(#function) request: \(request)")
        
        requestList(request: request, keyPath: "items")
            .sink(receiveCompletion: { _ in
            }, receiveValue: { (items : [Media]) in
                DSLog.log("items: \(items.count)")

                if let item = items.first {
                    promise?(.success(item))
                }
            }).store(in: &cancellable)
    }
    
    static func getUserDetail(userName: String) async throws -> User {
        DSLog.log("\(#function) userName: \(userName)")
        
        guard let url: URL = "https://i.instagram.com/api/v1/users/web_profile_info/?username=\(userName)".url else { throw APIError.invalidUrl }
        var request: URLRequest = URLRequest(url: url)
        request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")
        request.addValue(AppConfig.appId, forHTTPHeaderField: "X-IG-App-ID")
        
        return try await withCheckedThrowingContinuation({ continuation in
            requestObject(request: request, keyPath: "data.user")
                .sink(receiveCompletion: { _ in
                }, receiveValue: { (user : User) in
                    DSLog.log("items: \(user.toJSONString(prettyPrint: true) ?? "")")
                    continuation.resume(returning: user)
                }).store(in: &cancellable)
        })
    }
    
    static func getStories(userId: String) async throws -> [ReelsMedia] {
        DSLog.log("\(#function) userId: \(userId)")
        
        guard let url: URL = "https://i.instagram.com/api/v1/feed/reels_media/?reel_ids=\(userId)".url else { throw APIError.invalidUrl }
        var request: URLRequest = URLRequest(url: url)
        request.addValue(AppConfig.cookies, forHTTPHeaderField: "Cookie")
        request.addValue(AppConfig.appId, forHTTPHeaderField: "X-IG-App-ID")
        
        return try await withCheckedThrowingContinuation({ continuation in
            requestList(request: request, keyPath: "reels_media")
                .sink(receiveCompletion: { _ in
                }, receiveValue: { (items : [ReelsMedia]) in
                    DSLog.log("items: \(items.count)")
                    continuation.resume(returning: items)
                }).store(in: &cancellable)
        })
    }
}
