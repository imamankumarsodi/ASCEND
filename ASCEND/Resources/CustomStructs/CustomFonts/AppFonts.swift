//
//  AppFonts.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit


//MARK: - Creating fonts
enum AppFontName: String {
  
    case poppins           =        "Poppins"
  
}

enum AppFont: String {
    case regular             =        "Regular"

    case italic              =        "Italic"
    case thin                =        "Thin"
    case thinItalic          =        "ThinItalic"
    case extraLight          =        "ExtraLight"
    case extraLightItalic    =        "ExtraLightItalic"
    case light               =        "Light"
    case lightItalic         =        "LightItalic"
    case medium              =        "Medium"
    case mediumItalic        =        "MediumItalic"
    case semiBold            =        "SemiBold"
    case semiBoldItalic      =        "SemiBoldItalic"
    case extraBold           =        "ExtraBold"
    case extraBoldItalic     =        "ExtraBoldItalic"
    case bold                =        "Bold"
    case boldItalic          =        "BoldItalic"
    case black               =        "Black"
    case blackItalic         =        "BlackItalic"

   
    func size(_ name: AppFontName,size: CGFloat) -> UIFont {
        
        if let font = UIFont(name: self.fullFontName(name.rawValue), size: size + 1.0) {
            return font
        }
        fatalError("Font '\(String(describing: fullFontName))' does not exist.")
    }
    
    fileprivate func fullFontName(_ fontName:String) -> String {
        
            return rawValue.isEmpty ? fontName : fontName + "-" + rawValue
       
        
    }
}
