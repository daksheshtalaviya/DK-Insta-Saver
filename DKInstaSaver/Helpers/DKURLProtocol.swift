//
//  DKURLProtocol.swift
//  DKInstaSaver
//
//  Created by Dksh on 10/08/22.
//

import Foundation

class DKURLProtocol : URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        DSLog.log("request: \(request.url?.absoluteString ?? "")")
        return false
    }
}
