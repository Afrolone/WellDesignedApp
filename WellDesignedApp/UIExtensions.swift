//
//  UIExtensions.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 14. 12. 2021..
//

import Foundation
import UIKit

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

extension UISegmentedControl {
    func setTheView() {
        let backgroundColor = UIColor.white
        let dividerColor = UIColor(rgbColorCodeRed: 246, green: 248, blue: 250, alpha: CGFloat(1))
        let tintColorImage = UIImage(color: backgroundColor)
        let dividerColorImage = UIImage(color: dividerColor)
        // Must set the background image for normal to something (even clear) else the rest won't work
        setBackgroundImage(UIImage(color: backgroundColor), for: .normal, barMetrics: .default)
        setBackgroundImage(tintColorImage, for: .selected, barMetrics: .default)
        setBackgroundImage(UIImage(color: tintColor.withAlphaComponent(0.2)), for: .highlighted, barMetrics: .default)
        setBackgroundImage(tintColorImage, for: [.highlighted, .selected], barMetrics: .default)
        setDividerImage(dividerColorImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        layer.borderWidth = 1
        layer.borderColor = tintColor.cgColor
    }
}

public extension UIImage {
      convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
      }
    
}
