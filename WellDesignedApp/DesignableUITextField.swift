//
//  DesignableTextField.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 13. 12. 2021..
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
    
    func setPlaceHolderStyle() {
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[
            .foregroundColor: UIColor(rgbColorCodeRed: 30, green: 40, blue: 67, alpha: CGFloat(1)),
            .font: UIFont(name: "Rubik-Regular", size: 14)!
        ])
    }
    
//    @IBInspectable var permanentPlaceholder: String? {
//        didSet {
//            placeholder = permanentPlaceholder
//        }
//    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
//    func setPlaceHolder(to: String) {
//        permanentPlaceholder = to
//    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
}
