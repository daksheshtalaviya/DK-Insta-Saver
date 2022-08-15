//
//  UserDetailViewModel.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import Foundation
import ObjectMapper

class UserDetailViewModel {
    
    let controller: UserDetailController
    
    var items: [UserDetailController.MediaSegmentType : [Model]] = [:]
    
    init(controller: UserDetailController) {
        self.controller = controller
    }
    
}
