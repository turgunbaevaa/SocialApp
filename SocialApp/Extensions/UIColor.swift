//
//  UIColor.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 13/1/24.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        
        guard scanner.scanHexInt32(&color) else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }
        
        let mask: UInt32 = 0x000000FF
        let r = Int(color >> 16) & Int(mask)
        let g = Int(color >> 8) & Int(mask)
        let b = Int(color) & Int(mask)
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

