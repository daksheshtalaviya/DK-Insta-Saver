//
//  APIManager.swift
//  DKInstaSaver
//
//  Created by Dksh on 13/08/22.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Combine
import ObjectMapper

enum APIError: Error {
    case invalidUrl
}

class APIManager {
    static var cancellable: Set<AnyCancellable> = []
    
    static func requestObject<T: Model>(request: URLRequest, keyPath: String? = nil) -> Future<T, Error> {
        Future { promise in
            AF.request(request)
                .responseObject(keyPath: keyPath,
                               completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let items):
                        promise(.success(items))
                        break
                    case .failure(let error):
                        handleError(error: error, response: response.response)
                        promise(.failure(error))
                    }
                })
        }
    }
    
    static func requestList<T: Model>(request: URLRequest, keyPath: String? = nil) -> Future<[T], Error> {
        Future { promise in
            AF.request(request)
                .responseArray(keyPath: keyPath,
                               completionHandler: { (response: DataResponse<[T], AFError>) in
                    switch response.result {
                    case .success(let items):
                        promise(.success(items))
                        break
                    case .failure(let error):
                        handleError(error: error, response: response.response)
                        promise(.failure(error))
                    }
                })
        }
    }
    
    static func handleError(error: Error, response: HTTPURLResponse?) {
        DSLog.log("error: \(error)")

        if 400...499 ~= (response?.statusCode ?? 0) {
            ProgressHUDManager.showProgress(message: "Post not found or Authentication failed")
        } else {
            ProgressHUDManager.showProgress(message: "API error: \(error.localizedDescription)")
        }
    }
}
