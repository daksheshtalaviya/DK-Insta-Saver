//
//  DSConstants.swift
//  OTTPlatform
//
//  Created by Dksh on 27/02/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit

let instagramUrl: String = "https://www.instagram.com/instagram/"

enum EnvironmentType {
    case production, development
}

enum DSImage {
    
    case appIcon
    case checkmark

    var image: UIImage {
        switch self {
        case .appIcon   : return #imageLiteral(resourceName   : "app_logo")
        case .checkmark : return #imageLiteral(resourceName : "ic_checkmark")
        }
    }
}

struct DSKey {
    static let lastEmailId        = "lastEmailId"
    static let isLogin            = "isLogin"
    static let isWifi             = "isWifi"
    static let currentUserProfile = "currentUserProfile"
    static let notification       = "notification"
    
}

struct DSInterval {
    //In Second
    
    struct Home {
        static let AutoScrollBanners: CGFloat = 3.0
    }
    
    struct Orientation {
        static let fullscreen: Double = 5.0
    }
    
    struct Player {
        static let seekDuration      : Double = 15.0
        static let mediaControl      : Double = 5.0
        static let retryAttemptPlayer: Int    = 10
    }
}

struct DSText {
    
    struct Text {
        static let watchMovie     = "Watch Movie"
        static let relatedVideos  = "Related Videos"
        
        static let Dismiss        = "Dismiss"
        static let Download       = "Download"
        static let DownloadAlert  = "Download Alert"
        static let CancelDownload = "Cancel Download"

    }
    
    struct Message {
        static let startDownloadAlert  = "Are you sure you want to download?"
        static let cancelDownloadAlert = "Are you sure you want to cancel download?"
        static let videoNotAvailable   = "Video not available !!"
    }
}
