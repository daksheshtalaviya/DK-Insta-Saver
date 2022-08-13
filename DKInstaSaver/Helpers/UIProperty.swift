//
//  Created by DK on 29/11/17.
//  Copyright © 2017 DK. All rights reserved.
//

import UIKit

enum ImageLayoutType {
    case none
    case circle
    case square
}

@IBDesignable extension UIView
{
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = self.layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            maskToBounds = newValue > 0
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let color = self.layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat {
        get {
            return CGFloat(self.layer.shadowOpacity)
        }
        set {
            self.layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var maskToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set {
            self.layer.masksToBounds = newValue
        }
    }
    
  
    @IBInspectable var customIdentifier: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }
}

@IBDesignable extension UIButton
{
    @IBInspectable var adjustsFontSizeToFitWidth: Bool {
        get {
            return self.titleLabel?.adjustsFontSizeToFitWidth ?? false
        }
        set {
            self.titleLabel?.adjustsFontSizeToFitWidth = newValue
        }
    }
    
    @IBInspectable var numberOfLines: Int {
        get {
            return self.titleLabel?.numberOfLines ?? 1
        }
        set {
            self.titleLabel?.numberOfLines = newValue
        }
    }
    
    @IBInspectable var imageViewContentMode: Int {
        get {
            return self.imageView?.contentMode.rawValue ?? 0
        }
        set {
            self.imageView?.contentMode = UIView.ContentMode(rawValue: newValue) ?? .scaleToFill
        }
    }
    
    @IBInspectable var textAlignment: Int {
        get {
            return self.titleLabel?.textAlignment.rawValue ?? 0
        }
        set {
            self.titleLabel?.textAlignment = NSTextAlignment(rawValue: newValue) ?? .left
        }
    }
    
    @IBInspectable var accessibilityModal: Bool {
        get {
            return accessibilityViewIsModal
        }
        set {
            accessibilityViewIsModal = newValue
        }
    }
    
    @IBInspectable var sizeImage: CGSize {
        get {
            return self.imageView?.image?.size ?? CGSize.zero
        }
        set {
            if let image = self.currentImage {
                let imgUpdate = image.resizedImage(newValue)
                self.setImage(imgUpdate, for: .normal)
            }
        }
    }
}

@IBDesignable extension UILabel
{
    @IBInspectable var adjustsFontSizeToFitWidthText: Bool {
        get {
            return self.adjustsFontSizeToFitWidth
        }
        set {
            self.adjustsFontSizeToFitWidth = newValue
        }
    }
}

@IBDesignable extension UITextField
{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            if let newValue = newValue {
                let attr: NSMutableAttributedString = (self.attributedPlaceholder?.mutableCopy() as? NSMutableAttributedString) ?? NSMutableAttributedString()
                let range = NSMakeRange(0, (attr.string.count))
                attr.addAttributes([.foregroundColor: newValue], range: range)
                self.attributedPlaceholder = attr
            }
        }
    }
    
    @IBInspectable var placeHolderFont: UIFont {
        get {
            return self.placeHolderFont
        }
        set {
            let attr: NSMutableAttributedString = (self.attributedPlaceholder?.mutableCopy() as? NSMutableAttributedString) ?? NSMutableAttributedString()
            let range = NSMakeRange(0, (attr.string.count))
            attr.addAttributes([.font: newValue], range: range)
            self.attributedPlaceholder = attr
        }
    }
    
    @IBInspectable var leftViewWidth: CGFloat {
        get {
            return leftView?.frame.width ?? 0
        }
        set {
            let viewGap = UIView.init(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
            self.leftView = viewGap
            self.leftViewMode = .always
        }
    }
    
    @IBInspectable var rightViewWidth: CGFloat {
        get {
            return rightView?.frame.width ?? 0
        }
        set {
            let viewGap = UIView.init(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
            self.rightView = viewGap
            self.rightViewMode = .always
        }
    }
}

@IBDesignable extension UITextView
{
    
    @IBInspectable var lineFragmentPadding: CGFloat {
        get {
            return self.textContainer.lineFragmentPadding
        }
        set {
            self.textContainer.lineFragmentPadding = newValue
        }
    }
}

@IBDesignable extension UIImageView {

    @IBInspectable var renderingMode: UIImage.RenderingMode {
        get {
            return self.renderingMode
        }
        set {
            self.image = self.image?.withRenderingMode(newValue)
        }
    }
}

