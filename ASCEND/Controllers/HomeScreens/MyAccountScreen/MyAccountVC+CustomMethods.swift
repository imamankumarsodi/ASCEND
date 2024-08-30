//
//  MyAccountVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
extension MyAccountVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.MyAccountLT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        
        let paragraphStyleCenter = NSMutableParagraphStyle()
        paragraphStyleCenter.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyleCenter.lineSpacing = 5 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.ExploreLT)", font: AppFont.light.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyleCenter, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.btnExploreRef.setAttributedTitle(myMutableString, for: .normal)
        
        
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        myMutableString = NSMutableAttributedString()
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.BalanceLT, font: AppFont.semiBold.size(AppFontName.poppins, size: 15), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: " - \(2000) \(ConstantTexts.AscendCoinsLT)", font: AppFont.light.size(AppFontName.poppins, size: 15), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        self.lblBalance.attributedText = myMutableString
        
        
    }

}
