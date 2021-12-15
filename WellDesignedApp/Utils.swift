//
//  Utils.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 13. 12. 2021..
//

import Foundation
import UIKit

class Utils {
    static func segmentedControlSetup(segmentedControl: UISegmentedControl, container: UIView) {
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Rubik-Medium", size: 16)!
        ], for: .selected)
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Rubik-Light", size: 16)!
        ], for: .normal)
        segmentedControl.setTheView()
        container.layer.cornerRadius = 18
        container.clipsToBounds = true
    }
    
    static func setButton(button: UIButton) {
            button.layer.cornerRadius = 16
            button.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)

        gradient.frame = button.bounds
        gradient.colors = [UIColor(rgbColorCodeRed: 169, green: 59, blue: 254, alpha: CGFloat(1)).cgColor,
                           UIColor(rgbColorCodeRed: 201, green: 97, blue: 255, alpha: CGFloat(1)).cgColor]

        button.layer.insertSublayer(gradient, at: 0)
        }
    
    static func setTextView(textField: DesignableUITextField, imageName: String, placeholder: String) {
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(5)
        textField.setRightPaddingPoints(5)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(rgbColorCodeRed: 226, green: 230, blue: 235, alpha: CGFloat(1)).cgColor
        
        if let image = UIImage(named: imageName) {
            textField.leftSideImage = image
        }
        
        textField.font = UIFont(name: "Rubik-Regular", size: 14.0)
        textField.textColor = UIColor(rgbColorCodeRed: 30, green: 40, blue: 67, alpha: CGFloat(1))
        textField.placeholder = placeholder
        textField.setPlaceHolderStyle()
        
        textField.backgroundColor = UIColor.white
    }
    
}

