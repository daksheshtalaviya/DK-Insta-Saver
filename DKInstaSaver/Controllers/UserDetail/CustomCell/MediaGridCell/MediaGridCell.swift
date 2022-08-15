//
//  MediaGridCell.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit

class MediaGridCell: UICollectionViewCell {
    
    @IBOutlet var imgMedia: UIImageView!
    @IBOutlet var imgMediaType: UIImageView!

    var media: Media? {
        didSet {
            setDetail()
        }
    }
    
    private func setDetail() {
        
        imgMediaType.image = media?.media_type == .video ? DSImage.video.image : nil
        
        let thumbUrl: String? = media?.image_versions2?.candidates?.last?.url
        imgMedia.loadImage(with: thumbUrl, placeholderImage: DSImage.appIcon.image)
    }
}
