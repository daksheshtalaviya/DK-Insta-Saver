//
//  MediaGridCell.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit

class MediaGridCell: UICollectionViewCell {
    static let identifier = "MediaGridCell"
    
    @IBOutlet var imgMedia: UIImageView!
    @IBOutlet var imgMediaType: UIImageView!

    var model: Model? {
        didSet {
            setDetail()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.cornerRadius = 10
        imgMediaType.tintColor = .white
    }
    
    private func setDetail() {
        
        let media: Media? = model as? Media
        
        imgMediaType.image = media?.media_type?.icon
        imgMediaType.renderingMode = .alwaysTemplate

        let thumbUrl: String? = media?.image_versions2?.candidates?.last?.url ?? media?.carousel_media?.first?.image_versions2?.candidates?.last?.url
        imgMedia.loadImage(with: thumbUrl, placeholderImage: DSImage.appIcon.image)
    }
}
