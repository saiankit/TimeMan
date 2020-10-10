//
//  ExtensionColor.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/1/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let redNum = Int(color >> 16) & mask
        let greenNum = Int(color >> 8) & mask
        let blueNum = Int(color) & mask
        let red = CGFloat(redNum) / 255.0
        let green = CGFloat(greenNum) / 255.0
        let blue = CGFloat(blueNum) / 255.0
        self.init(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha)
    }
    func toHexString() -> String {
        var redNum: CGFloat = 0
        var greenNum: CGFloat = 0
        var blueNum: CGFloat = 0
        var alphaNum: CGFloat = 0
        getRed(&redNum, green: &greenNum, blue: &blueNum, alpha: &alphaNum)
        let rgbNum: Int = (Int)(redNum * 255) << 16 | (Int)(greenNum * 255) << 8 | (Int)(blueNum * 255) << 0
        return String(format: "#%06x", rgbNum)
    }
}
