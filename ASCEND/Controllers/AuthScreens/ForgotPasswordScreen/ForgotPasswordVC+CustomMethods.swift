//
//  ForgotPasswordVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 23/04/21.
//

import Foundation
import UIKit
extension ForgotPasswordVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.ForgotPasswordHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
        super.isHiddenNavigationBar(false)
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.validationMethodManager == nil {
            self.validationMethodManager = ValidationClass.shared
        }
        
        
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        
        
    }
}

//MARK: - Validation methods
extension ForgotPasswordVC{
    //TODO: Validate fields implementation
    internal func validateFields(validHandler: @escaping ( String, Bool,UIView?) -> Void){
        if !validationMethodManager!.checkEmptyField(self.txtCountryCode.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.SelectCountryCodeALERT, false, self.txtCountryCode)
            return
            
        }
        
        
        if !validationMethodManager!.checkEmptyField(self.txtPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterPhoneNumberALERT, false, self.txtPhone)
            return
            
        }
        
        validHandler( ConstantTexts.empty, true, nil)
        return
        
    }
}
