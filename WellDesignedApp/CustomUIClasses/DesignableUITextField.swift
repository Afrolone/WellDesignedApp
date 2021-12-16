//
//  DesignableTextField.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 13. 12. 2021..
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField, UITextFieldDelegate {
    
    var isInErrorStyle = false
    var errorMessage = ""
    var permanentPlaceHolder = ""
    var leftImageView: UIImageView?
    var leftErrorImage: UIImage?
    var righImageButton: UIButton?
    var rightErrorImage: UIImage?
    
    func toggleErrorStyle(error: Bool) {
        isInErrorStyle = error
        if (isInErrorStyle) {
            layer.borderColor = UIColor.red.cgColor
            leftImageView?.image = leftErrorImage
            righImageButton?.setImage(rightErrorImage, for: .normal)
            setPlaceHolderStyle()
            placeholder = errorMessage
            
        } else {
            layer.borderColor = UIColor(rgbColorCodeRed: 226, green: 230, blue: 235, alpha: CGFloat(1)).cgColor
            placeholder = permanentPlaceHolder
            leftImageView?.image = leftSideImage
            righImageButton?.setImage(rightSideImage, for: .normal)
            setPlaceHolderStyle()
            placeholder = permanentPlaceHolder
        }
        
    }
    
    func setPlaceHolderStyle() {
        if (isInErrorStyle) {
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[
                .foregroundColor: UIColor.red,
                .font: UIFont(name: "Rubik-Regular", size: 14)!
            ])
        } else {
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[
                .foregroundColor: UIColor(rgbColorCodeRed: 30, green: 40, blue: 67, alpha: CGFloat(1)),
                .font: UIFont(name: "Rubik-Regular", size: 14)!
            ])        }
        
    }
    
    @IBInspectable var leftSideImage:UIImage = UIImage() {

        didSet {
            leftImageView = UIImageView.init(image: leftSideImage)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 52))
            if let imageView = leftImageView {
                containerView.addSubview(imageView)
                imageView.center = containerView.center
            }
            leftView = containerView
            leftViewMode = .always
            leftErrorImage = leftSideImage.withTintColor(UIColor.red)
        }
    }

    @IBInspectable var rightSideImage:UIImage = UIImage() {

        didSet {
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 52))
            righImageButton = UIButton(type: UIButton.ButtonType.custom)
            if let button = righImageButton {
                button.frame = CGRect(x: 0, y: 0, width: 22, height: 16)
                button.setImage(rightSideImage, for: .normal)
                button.addTarget(self, action: #selector(revealSecureText), for: .touchUpInside)
                button.center = containerView.center
                containerView.addSubview(button)
            }
            
            rightView = containerView
            rightViewMode = .always
            rightErrorImage = rightSideImage.withTintColor(UIColor.red)
        }
    }
    
    @objc func revealSecureText() {
        isSecureTextEntry = !isSecureTextEntry
    }
    
}
