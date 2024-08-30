//
//  SelectReasonPopupViewC+CustomMethod.swift
//  ASCEND
//
//  Created by Aman Kumar on 01/05/21.
//

import Foundation
import UIKit
extension SelectReasonPopupViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        
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
        customMethodManager?.provideShadowAndCornerRadius(self.viewTableBG, 20, [.layerMinXMinYCorner,.layerMaxXMinYCorner], AppColor.appColor, 0, 0, 0, 0, 0, AppColor.appColor)
        self.registerNib()
    }
    
    //TODO: register nib file
    private func registerNib(){
        self.tableView.register(nib: MoreTableViewCell.className)
        self.tableView.hideEmptyCells()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
        }
        
       
    }

}
        
