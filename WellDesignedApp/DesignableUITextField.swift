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
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[
            .foregroundColor: UIColor(rgbColorCodeRed: 30, green: 40, blue: 67, alpha: CGFloat(1)),
            .font: UIFont(name: "Rubik-Regular", size: 14)!
        ])
    }
    
    @IBInspectable var leftSideImage:UIImage = UIImage() {

        didSet {
            let leftImageView = UIImageView.init(image: leftSideImage)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 52))
            containerView.addSubview(leftImageView)
            leftImageView.center = containerView.center
            leftView = containerView
            leftViewMode = .always
        }
    }

    @IBInspectable var rightSideImage:UIImage = UIImage() {

        didSet {
            let button = UIButton(type: UIButton.ButtonType.custom)
            button.frame = CGRect(x: 0, y: 0, width: 22, height: 16)
            button.setImage(rightSideImage, for: .normal)
            button.addTarget(self, action: #selector(revealSecureText), for: .touchUpInside)
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 52))
            containerView.addSubview(button)
            button.center = containerView.center
            rightView = containerView
            rightViewMode = .always
        }
    }
    
    @objc func revealSecureText() {
        isSecureTextEntry = !isSecureTextEntry
    }
    
}
