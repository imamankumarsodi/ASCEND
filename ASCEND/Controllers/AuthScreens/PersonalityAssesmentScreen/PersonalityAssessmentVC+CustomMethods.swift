//
//  PersonalityAssessmentVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation
import UIKit


extension PersonalityAssessmentVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.PersonalityAssessmentHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
    }
    
    //TODO: Init values
    internal func initValues(){
       
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){

    }
}
