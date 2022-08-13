//
//  BaseView.swift
//  OTTPlatform
//
//  Created by Dksh on 27/02/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    deinit {
        DSLog.log(fileName: self.className)
    }
    
}
