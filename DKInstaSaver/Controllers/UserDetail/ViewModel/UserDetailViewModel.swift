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
    var maxIds: [UserDetailController.MediaSegmentType : [String? : Bool]] = [:]

    init(controller: UserDetailController) {
        self.controller = controller
    }
    
    func refreshData() {
        DSLog.log()
        
        loadMedias()
    }
    
    func loadMedias() {
        DSLog.log()
        
        controller.reloadData()

        let type = controller.selectedMediaSegmentType
        guard items[type]?.count ?? 0 == 0 else { return }
        
        Task {
            do {
                switch type {
                case .stories:
                    let stories = try await APIManager.getStories(userId: controller.user?.id ?? "")
                    let medias: [Media] = stories.first?.items ?? []
                    DSLog.log("medias: \(medias.count)")
                    
                    items[type] = medias
                    break
                case .images, .videos:
                    let lastMaxId: String? = maxIds[type]?.keys.first ?? ""
                    let posts = try await APIManager.getPosts(userId: controller.user?.id ?? "", maxId: lastMaxId)
                    let medias: [Media] = posts.items ?? []
                    DSLog.log("medias: \(medias.count)")
                    
                    if type == .videos {
                        items[type] = medias.filter({$0.media_type == .video})
                    } else {
                        items[type] = medias.filter({$0.media_type == .image})
                    }
                    maxIds[type] = [posts.next_max_id : posts.more_available ?? false]
                    break
                }
            } catch {
                DSLog.log("error: \(error.localizedDescription)")
            }
            
            await controller.reloadData()
        }
    }
    
}
