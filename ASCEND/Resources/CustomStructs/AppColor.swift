//
//  AppColor.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit
struct AppColor {
    
    //TODO: New color schemes
    public static let appColor               = UIColor.clear
    public static let whiteColor             = UIColor.white
    public static let redColor               = UIColor.red
    public static let greenColor             = UIColor.green
    public static let appGradientColor1      = #colorLiteral(red: 0.5937624574, green: 0.3498765528, blue: 0.8243690133, alpha: 1)
    public static let appGradientColor2      = #colorLiteral(red: 0.7230339646, green: 0.592391789, blue: 0.8417268395, alpha: 1)
    
    public static let darkGrayColor          = UIColor.init(hexString: "#707070")
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let rColor = Int(color >> 16) & mask
        let gColor = Int(color >> 8) & mask
        let bColor = Int(color) & mask
        let red   = CGFloat(rColor) / 255.0
        let green = CGFloat(gColor) / 255.0
        let blue  = CGFloat(bColor) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var rColor:CGFloat = 0
        var gColor:CGFloat = 0
        var bColor:CGFloat = 0
        var aColor:CGFloat = 0
        getRed(&rColor, green: &gColor, blue: &bColor, alpha: &aColor)
        let rgb:Int = (Int)(rColor*255)<<16 | (Int)(gColor*255)<<8 | (Int)(bColor*255)<<0
        return String(format:"#%06x", rgb)
    }
}
