//
//  UIImageView+Extensions.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(with url: String?,
                   placeholderImage: UIImage? = nil,
                   options: SDWebImageOptions = [.progressiveLoad],
                   context: [SDWebImageContextOption : Any]? = nil,
                   progressBlock: SDImageLoaderProgressBlock? = nil,
                   completedBlock: SDExternalCompletionBlock? = nil) {
        
        self.loadImage(with: url?.url, placeholderImage: placeholderImage, options: options, context: context, progressBlock: progressBlock, completedBlock: completedBlock)
    }
    
    func loadImage(with url: URL?,
                   placeholderImage: UIImage? = nil,
                   options: SDWebImageOptions = [],
                   context: [SDWebImageContextOption : Any]? = nil,
                   progressBlock: SDImageLoaderProgressBlock? = nil,
                   completedBlock: SDExternalCompletionBlock? = nil) {
        
        self.sd_setImage(with: url, placeholderImage: placeholderImage, options: options, context: context, progress: progressBlock, completed: completedBlock)
    }
}
