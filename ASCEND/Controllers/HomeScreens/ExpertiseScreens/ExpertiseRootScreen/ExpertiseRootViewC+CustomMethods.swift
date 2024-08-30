//
//  ExpertiseRootViewC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
extension ExpertiseRootViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.ExpertiseHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
        customTabBar.isHidden = true
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
        self.loadScrollViewWithcontroller()
    }
}
