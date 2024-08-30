//
//  MyPersonalityScreenViewC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit
extension MyPersonalityScreenViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.MyPersonalityHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
       
        self.tableView.hideEmptyCells()
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        self.registerNib()
    }
    
    //TODO: register nib file
    private func registerNib(){
        self.tableView.register(nib: PersonalityTableViewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
        }
    }

}
        
