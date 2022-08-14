//
//  DashboardViewModel.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import Foundation

class DashboardViewModel: BaseNSObject {
    let controller: DashboardController?

    init(_ controller: DashboardController) {
        self.controller = controller
        super.init()
    }
    
}
