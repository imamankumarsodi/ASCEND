//
//  SuggestedTopicVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation
import UIKit
import CloudTagView

extension SuggestedTopicVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.PersonalityAssessmentHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.topicModeling == nil {
            self.topicModeling = SuggestedTopicVM.shared
        }
        
        if  self.dataListVM == nil{
            self.dataListVM = self.topicModeling?.prepareDataSourceStatic()
        }
       
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        
        myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.ViewFullListLT)", font: AppFont.light.size(AppFontName.poppins, size: 13), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        self.footer.btnViewAllRef.setAttributedTitle(myMutableString, for: .normal)
        
        
        
        myMutableString = NSMutableAttributedString()
        
        myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.AboutMyPersoLT)", font: AppFont.light.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.btnaAboutMyPersonalityRef.setAttributedTitle(myMutableString, for: .normal)
        
        
        self.registerNib()
        

    }
    
    //TODO: register nib file
    private func registerNib(){
        self.tableView.register(nib: PersonalAsessmentTableViewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            if let elements = self.dataListVM?.elements{
                for item in elements{
                    let withoutIconTag = TagView(text: item.title)
                    withoutIconTag.iconImage = nil
                    withoutIconTag.marginTop = 10
                    withoutIconTag.font = AppFont.light.size(AppFontName.poppins, size: 13)
                    self.footer.topicCollectionView.tags.append(withoutIconTag)
                }
            }
        }
    }
}
