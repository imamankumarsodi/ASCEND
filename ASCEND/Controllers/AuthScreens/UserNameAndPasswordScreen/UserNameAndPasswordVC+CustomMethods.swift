//
//  UserNameAndPasswordVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 22/04/21.
//

import Foundation
import UIKit


extension UserNameAndPasswordVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
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
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 1 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.ByProceedLT) ", font: AppFont.light.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.TermsAndPoliciesLT)", font: AppFont.semiBold.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblAlreadyAccount.attributedText = myMutableString
        
        let lblSignUpRefTap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignUpRefTapped(_:)))
        self.lblAlreadyAccount.isUserInteractionEnabled = true
        self.lblAlreadyAccount.addGestureRecognizer(lblSignUpRefTap)
        
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.AaLT)\n", font: AppFont.light.size(AppFontName.poppins, size: 16), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.UpperLowerLT)", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblUpperCaseLowerCase.attributedText = myMutableString
        
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.NumLT)\n", font: AppFont.light.size(AppFontName.poppins, size: 16), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.NumericLT)", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblNumericCase.attributedText = myMutableString
        
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.SpeLT)\n", font: AppFont.light.size(AppFontName.poppins, size: 16), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.SpecialCharactersLT)", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblSpecialChar.attributedText = myMutableString
        
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.CharLentLT)\n", font: AppFont.light.size(AppFontName.poppins, size: 16), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.CharactersLT)", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblCharLength.attributedText = myMutableString
        
        
        
        
    }
}


//MARK: - Validation methods
extension UserNameAndPasswordVC{
    //TODO: Validate fields implementation
    internal func validateFields(validHandler: @escaping ( String, Bool,UIView?) -> Void){
        
        if !validationMethodManager!.checkEmptyField(self.txtUserName.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterUserNameALERT, false, self.txtUserName)
            return
            
        }else{
            if !validationMethodManager!.isValidUsername(self.txtUserName.text!.trimmingCharacters(in: .whitespacesAndNewlines)){
                validHandler( ConstantTexts.EnterUserNameALERT, false, self.txtUserName)
                return
            }
        }
        
        if !validationMethodManager!.checkEmptyField(self.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            
            validHandler( ConstantTexts.EnterPasswordALERT, false, self.txtPassword)
            return
        }else{
           if !validationMethodManager!.isValidPasssword(self.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterValidPasswordALERT, false, self.txtPassword)
            return
            }
                
               
        }
        
        
        if !validationMethodManager!.checkEmptyField(self.txtConfirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            
            validHandler( ConstantTexts.EnterPasswordALERT, false, self.txtConfirmPassword)
            return
        }else{
           if !validationMethodManager!.isValidPasssword(self.txtConfirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterValidPasswordALERT, false, self.txtConfirmPassword)
            return
            }
                
               
        }
        
        
        if self.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines) != self.txtConfirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines){
            validHandler( ConstantTexts.EnterSamePasswordALERT, false, nil)
            return
        }
        
        validHandler( ConstantTexts.empty, true, nil)
        return
        
        
    }

}
