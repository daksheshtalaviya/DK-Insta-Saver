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
    @IBOutlet weak var lblCurrentCount: UILabel!
    @IBOutlet weak var stepperMedia: UIStepper!
    @IBOutlet var webView: WKWebView!

    lazy var viewModel: MediaPreviewViewModel = MediaPreviewViewModel(controller: self)
    var media: Media?
    var medias: [Media] = []
    var currentMedia: Media? {
        medias[safe: stepperMedia.value.toIntOrDefault]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       initialize()
    }
    
    private func initialize() {
        
        guard let media = media else { return }
        medias = media.carousel_media ?? [media]
        
        configureButtons()
        configureStepper()
        configureWebView()
        
        setDetail()
    }
    
    private func configureButtons() {
        
        btnBack?.addAction(UIAction(handler: { sender in
            self.goBack(from: self)
        }), for: .touchUpInside)
        
        btnDownload.addAction(UIAction(handler: { sender in
            DSLog.log("btnDownload")
            guard let url = self.currentMedia?.originalMediaUrl else { return }
            DownloadManager.shared.downloadFile(url: url)
        }), for: .touchUpInside)
        
        btnShare.addAction(UIAction(handler: { sender in
            DSLog.log("btnDownload")
            self.shareMedia()
        }), for: .touchUpInside)
    }
    
    private func configureStepper() {
        DSLog.log()

        stepperMedia.minimumValue = 0
        stepperMedia.maximumValue = Double(max(medias.count - 1, 0))
        stepperMedia.value = 0
        stepperMedia.setDecrementImage(stepperMedia.decrementImage(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
        stepperMedia.setIncrementImage(stepperMedia.incrementImage(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
        stepperMedia.subviews.first?.backgroundColor = .primary
        stepperMedia.cornerRadius = 8
        stepperMedia.tintColor = .white
        
        stepperMedia.addTarget(self, action: #selector(onClickStepperMedia(_:)), for: .valueChanged)
        
        onClickStepperMedia(stepperMedia)
    }
    
    @objc private func onClickStepperMedia(_ sender: UIStepper) {
        DSLog.log("sender: \(sender.value)")

        lblCurrentCount.text = "\(stepperMedia.value.toIntOrDefault + 1) / \(stepperMedia.maximumValue.toIntOrDefault + 1)"
        loadCurrentMedia()
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
        
        lblTitle?.text = "Media Preview"
        loadMedia(strUrl: media?.originalMediaUrl)
    }
}

extension MediaPreviewController {
    
    fileprivate func loadCurrentMedia() {
        let currentIndex: Int = Int(stepperMedia.value)
        DSLog.log("currentIndex: \(currentIndex)")

        let strUrl = medias[safe: currentIndex]?.originalMediaUrl
        loadMedia(strUrl: strUrl)
    }
}

extension MediaPreviewController {
    
    fileprivate func loadMedia(strUrl: String?) {
        
        guard let url = strUrl?.url else { return }
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
        
        guard let url = currentMedia?.originalMediaUrl?.url else { return }
        DSLog.log("url: \(url)")
        
        let sharedObjects: [Any] = [url]
        let activityController = UIActivityViewController(activityItems: sharedObjects, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        
        DispatchQueue.main.async {
            self.present(activityController, animated: true, completion: nil)
        }
    }
    
}
