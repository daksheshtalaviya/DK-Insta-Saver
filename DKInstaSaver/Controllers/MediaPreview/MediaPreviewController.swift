//
//  MediaPreviewController.swift
//  DKInstaSaver
//
//  Created by Dksh on 15/08/22.
//

import UIKit
import WebKit
import AVKit

class MediaPreviewController: BaseViewController {
    
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
    
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet var webView: WKWebView!

    lazy var viewModel: MediaPreviewViewModel = MediaPreviewViewModel(controller: self)
    var media: Media?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initialize()
    }
    
    private func initialize() {
        
        configureButtons()
        configureWebView()
        setDetail()
    }
    
    private func configureButtons() {
        
        btnBack?.addAction(UIAction(handler: { sender in
            self.goBack(from: self)
        }), for: .touchUpInside)
        
        btnDownload.addAction(UIAction(handler: { sender in
            DSLog.log("btnDownload")
            guard let url = self.media?.originalMediaUrl else { return }
            DownloadManager.shared.downloadFile(url: url)
        }), for: .touchUpInside)
        
        btnShare.addAction(UIAction(handler: { sender in
            DSLog.log("btnDownload")
            self.shareMedia()
        }), for: .touchUpInside)
    }
    
    private func configureWebView() {
        DSLog.log()

        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.allowsPictureInPictureMediaPlayback = true
        webView.configuration.allowsAirPlayForMediaPlayback = true
        webView.isOpaque = false
        webView.backgroundColor = .clear
    }
    
    fileprivate func setDetail() {
        
        lblTitle?.text = "\(media?.media_type == .video ? "Video" : "Image") Preview"
        loadMedia()
    }
}

extension MediaPreviewController {
    
    fileprivate func loadMedia() {
        
        guard let url = media?.originalMediaUrl?.url else { return }
        DSLog.log("url: \(url)")
        
        if media?.media_type == .video {
            openVideoPlayer(url: url)
            return
        }

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
    }
    
    fileprivate func openVideoPlayer(url: URL) {
        DSLog.log("url: \(url)")

        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        DispatchQueue.main.async {
            self.present(playerController, animated: true) {
                playerController.player?.play()
            }
        }
    }
}

extension MediaPreviewController {
    
    fileprivate func shareMedia() {
        
        guard let url = media?.originalMediaUrl?.url else { return }
        DSLog.log("url: \(url)")
        
        let sharedObjects: [Any] = [url]
        let activityController = UIActivityViewController(activityItems: sharedObjects, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        
        DispatchQueue.main.async {
            self.present(activityController, animated: true, completion: nil)
        }
    }
    
}
