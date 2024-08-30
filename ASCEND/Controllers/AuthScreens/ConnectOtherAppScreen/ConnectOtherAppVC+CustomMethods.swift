//
//  ConnectOtherAppVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 23/04/21.
//

import Foundation
import UIKit


extension ConnectOtherAppVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.ConnectOtherAppsHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
    }
    
    //TODO: Init values
    internal func initValues(){
       
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){

    }
}
