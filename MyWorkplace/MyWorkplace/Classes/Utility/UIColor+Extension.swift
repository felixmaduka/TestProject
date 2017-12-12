//
//  UIColor+Extension.swift
//  MyWorkplace
//
//  Created by Mobile Team 2 on 17/10/17.
//  Copyright © 2017 JCI. All rights reserved.
//

import UIKit
private struct Color {
    static let navigationBlue = 0x4F77B1
    static let darkBlack = 0x212223
    static let deepGray = 0xD0D1D2
    static let mulberry = 0x352384
    static let mulberryDark = 0x2A025D
    static let whiteDark = 0xF3F3F5
}

extension UIColor {
    
    /// Creates an instance of UIColor based on an RGB value.
    ///
    /// - parameter rgbValue: The Integer representation of the RGB value: Example: 0xFF0000.
    /// - parameter alpha:    The desired alpha for the color.
    convenience init(rgbValue: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Creates an UIImage from a color instance. This is useful for button backgrounds.
    ///
    /// - parameter width:  The desired width for the image.
    /// - parameter height: The desired height for the image.
    ///
    /// - returns: A UIImage containing only the instance color.
    func toImage(width: CGFloat = 2, height: CGFloat = 2) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(self.cgColor)
            context.fill(rect)
        }
        
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
    
    /// Top bar background color
    static func navBGBlue() -> UIColor {
        return UIColor(rgbValue: Color.navigationBlue)
    }
    
    /// Side menu background color
    static func menuBGBlack() -> UIColor {
        return UIColor(rgbValue: Color.darkBlack)
    }
    
    /// Side menu font color
    static func menuFontGrey() -> UIColor {
        return UIColor(rgbValue: Color.deepGray)
    }
}
