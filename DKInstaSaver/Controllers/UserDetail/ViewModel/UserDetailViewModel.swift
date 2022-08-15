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
    
    func loadMedias(loadMore: Bool = false) {
        DSLog.log()
        
        controller.reloadData()

        let type = controller.selectedMediaSegmentType
        guard items[type]?.count ?? 0 == 0 || loadMore else { return }
        
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
                    
                    if items[.images] == nil {
                        items[.images] = []
                    }
                    if items[.videos] == nil {
                        items[.videos] = []
                    }
                    
                    let videos = medias.filter({$0.media_type == .video})
                    let images = medias.filter({$0.media_type == .image || $0.media_type == .multiple})
                    if type == .videos {
                        items[type]?.append(contentsOf: videos)
                        items[.images]?.append(contentsOf: images)
                    } else {
                        items[.videos]?.append(contentsOf: videos)
                        items[type]?.append(contentsOf: images)
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
