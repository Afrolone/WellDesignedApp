//
//  Utils.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 13. 12. 2021..
//

import Foundation
import UIKit

class Utils {
    static func setTextViews(textField: DesignableUITextField, imageName: String, placeholder: String) {
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(5)
        textField.setRightPaddingPoints(5)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(rgbColorCodeRed: 226, green: 230, blue: 235, alpha: CGFloat(1)).cgColor
        
//        textField.leftViewMode = UITextField.ViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 52))
//        containerView.addSubview(imageView)
//        imageView.center = containerView.center
//        let image = UIImage(named: imageName)
//        imageView.image = image
//        textField.leftView = containerView
        
        let image = UIImage(named: imageName)
        textField.leftImage = image
        textField.leftPadding = 10
        
        textField.font = UIFont(name: "Rubik-Regular", size: 14.0)
        textField.textColor = UIColor(rgbColorCodeRed: 30, green: 40, blue: 67, alpha: CGFloat(1))
        textField.placeholder = placeholder
        textField.setPlaceHolderStyle()
        //textField.text = placeholder
        //textField.textColor = UIColor.black
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIColor {

   convenience init(rgbColorCodeRed red: Int, green: Int, blue: Int, alpha: CGFloat) {

     let redPart: CGFloat = CGFloat(red) / 255
     let greenPart: CGFloat = CGFloat(green) / 255
     let bluePart: CGFloat = CGFloat(blue) / 255

     self.init(red: redPart, green: greenPart, blue: bluePart, alpha: alpha)

   }
}
