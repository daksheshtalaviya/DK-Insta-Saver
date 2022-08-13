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
}
