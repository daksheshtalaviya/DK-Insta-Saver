//
//  BaseNSObject.swift
//  OTTPlatform
//
//  Created by Dksh on 12/03/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import Foundation

class BaseNSObject: NSObject {
    
    deinit {
        DSLog.log(fileName: self.className)
    }
    
}
