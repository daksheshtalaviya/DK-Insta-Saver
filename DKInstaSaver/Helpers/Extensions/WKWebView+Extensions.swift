//
//  WKWebView+Extensions.swift
//  DKInstaSaver
//
//  Created by Dksh on 07/08/22.
//

import WebKit
import Combine

extension WKWebView {
    
    func getContents(script: String) -> Future<Any?, Error> {
        DSLog.log("script: \(script)")
        
        return Future { promise in
            self.evaluateJavaScript(script) { result, error in
                DSLog.log("result: \(result.debugDescription), error: \(error.debugDescription)")
                
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(result))
                }
            }
        }
        
    }
    
    func getCookies(completion: ((Any?) -> Void)? = nil) {
        DSLog.log("\(#function)")

        self.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            let headers = cookies.compactMap { "\($0.name)=\($0.value)"}
            DSLog.log("headers: \(headers)")
            
            AppConfig.cookies = "sessionid=\(cookies.first(where: {$0.name == "sessionid"})?.value ?? "")"
            
            completion?(headers)
        }
    }
}
