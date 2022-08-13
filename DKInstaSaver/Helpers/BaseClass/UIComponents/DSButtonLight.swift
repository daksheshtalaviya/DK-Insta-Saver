//
//  DSButtonLight.swift
//  OTTPlatform
//
//  Created by Dksh on 13/03/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit

class DSButtonLight : UIButton {
    
    var titleColor: UIColor? {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
