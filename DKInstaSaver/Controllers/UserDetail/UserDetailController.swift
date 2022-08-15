//
//  UserDetailController.swift
//  DKInstaSaver
//
//  Created by Dksh on 14/08/22.
//

import UIKit
import Alamofire

class UserDetailController: BaseViewController {

    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var btnImage: UIButton!
    @IBOutlet var segmentMediaType: UISegmentedControl!
    @IBOutlet var clMedia: UICollectionView!

    var user: User?

    enum MediaSegmentType: Int, CaseIterable {
        case stories
        case images
        case videos
        
        var name: String {
            switch self {
            case .stories: return "Stories"
            case .images: return "Images"
            case .videos: return "Videos"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initialize()
    }
    
    private func initialize() {
        
        configureMediaSegmentTypes()
        configureButtons()
        configureCollection()
        
        setDetail()
    }
    
    private func configureMediaSegmentTypes() {
        
        segmentMediaType.setTitleColor(color: .white, for: .selected)
        segmentMediaType.setTitleColor(color: .black)

        segmentMediaType.removeAllSegments()
        MediaSegmentType.allCases.forEach { type in
            self.segmentMediaType.insertSegment(withTitle: type.name, at: type.rawValue, animated: false)
        }
        
        segmentMediaType.selectedSegmentIndex = 0
    }
    
    private func configureButtons() {
        
        btnBack?.addAction(UIAction(handler: { sender in
            self.goBack(from: self)
        }), for: .touchUpInside)
        
        btnImage.addAction(UIAction(handler: { sender in
            DSLog.log("btnImage")
        }), for: .touchUpInside)
    }
    
    fileprivate func setDetail() {
        
        lblName.text = user?.full_name?.trim
        lblUserName.text = user?.username?.trim
        btnImage.imageView?.contentMode = .scaleAspectFill

        btnImage.imageView?.loadImage(with: user?.profile_pic_url_hd, completedBlock: { [weak self] image, error, cacheType, url in
            DispatchQueue.main.async {
                self?.btnImage.setImage(image ?? DSImage.appIcon.image, for: .normal)
            }
        })

    }
}