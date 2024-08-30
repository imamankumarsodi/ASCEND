//
//  OnceMonthlyPopupViewC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 01/05/21.
//

import Foundation
import UIKit
extension OnceMonthlyPopupViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        
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
        customMethodManager?.provideShadowAndCornerRadius(self.viewTableBG, 20, [.layerMinXMinYCorner,.layerMaxXMinYCorner], AppColor.appColor, 0, 0, 0, 0, 0, AppColor.appColor)
    }
  

}
        
