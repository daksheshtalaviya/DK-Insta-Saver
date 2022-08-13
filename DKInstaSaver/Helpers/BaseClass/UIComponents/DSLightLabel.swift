//
//  DSLightLabel.swift
//  OTTPlatform
//
//  Created by Dksh on 06/03/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit

class DSLightLabel : UILabel {
    
    var titleColor: UIColor? {
        didSet {
            textColor = titleColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
