//
//  OTPViewC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 22/04/21.
//

import Foundation
import UIKit


extension OTPViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        if isComingFromForgot{
            super.isHiddenNavigationBar(false)
            super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.EnterVerificatHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
            self.lblTitle.isHidden = true
        }else{
            super.isHiddenNavigationBar(true)
            self.lblTitle.isHidden = false
        }
        
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
        
        otpView.otpFieldsCount = 4
        otpView.otpFieldDefaultBorderColor = AppColor.whiteColor
        otpView.otpFieldEnteredBorderColor = AppColor.whiteColor
        otpView.otpFieldErrorBorderColor = AppColor.redColor
        otpView.cursorColor = AppColor.whiteColor
        otpView.tintColor = AppColor.whiteColor
        otpView.otpFieldTextColor = AppColor.whiteColor
        otpView.otpFieldFont = AppFont.semiBold.size(AppFontName.poppins, size: 16)
        otpView.otpFieldBorderWidth = 2
        otpView.otpFieldSize = 60
        
        otpView.otpFieldDisplayType = .underlinedBottom
        
        otpView.delegate = self
        otpView.shouldAllowIntermediateEditing = false
        
        // Create the UI
        otpView.initializeUI()
        self.startTimer()
    }
    
    
    //MARK: - Timer methods
    //TODO: Start timer
    internal func startTimer(){
        // self.btnResendOTPRef.isHidden = true
        self.lblTimer.isHidden = false
        self.lblTimer.text = "01:00"
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    
    //TODO: Stop timer
    internal func stopTimer(){
        
        if self.lblTimer.alpha == 1{
            UIView.animate(withDuration: 0.2) {
                self.lblTimer.alpha = 0
            }
            self.lblTimer.isHidden = true
        }
        
        if self.viewProceedCBG.alpha == 1{
            UIView.animate(withDuration: 0.2) {
                self.viewProceedCBG.alpha = 0
            }
            self.viewProceedCBG.isHidden = true
        }
        
        self.viewResendBG.isHidden = false
        UIView.animate(withDuration: 0.4) {
            self.viewResendBG.alpha = 1
        }
        
        self.viewProceedRBG.isHidden = false
        UIView.animate(withDuration: 0.4) {
            self.viewProceedRBG.alpha = 1
        }
        
        
        timer?.invalidate()
        time = 60
    }
}

//MARK: - Validation methods
extension OTPViewC{
    //TODO: Validate fields implementation
    internal func validateFields(validHandler: @escaping ( String, Bool,UIView?) -> Void){
        if !validationMethodManager!.checkEmptyField(self.enteredOtp.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterOTPALERT, false, self.otpView)
            return
            
        }
    }
}



extension OTPViewC: VPMOTPViewDelegate {
    func hasEnteredAllOTP(hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        
        return enteredOtp == "1234"
    }
    
    func shouldBecomeFirstResponderForOTP(otpFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otpString: String) {
        enteredOtp = otpString
        print("OTPString: \(otpString)")
    }
}

