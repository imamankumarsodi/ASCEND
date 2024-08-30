//
//  LoginVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit

//MARK: - Custom methods
extension LoginVC{
    
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
    paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
    
    let myMutableString = NSMutableAttributedString()
    myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.NewToAscendLT) ", font: AppFont.light.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
    
    myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.CreateAccountLT)", font: AppFont.semiBold.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
    
    // *** Apply attribute to string ***
    myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
    // *** Set Attributed String to your label ***
    self.lblAlreadyAccount.attributedText = myMutableString
        
        
        let lblSignUpRefTap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignUpRefTapped(_:)))
        self.lblAlreadyAccount.isUserInteractionEnabled = true
        self.lblAlreadyAccount.addGestureRecognizer(lblSignUpRefTap)
        
        
    }
}

//MARK: - Validation methods
extension LoginVC{
    //TODO: Validate fields implementation
    internal func validateFields(validHandler: @escaping ( String, Bool,UIView?) -> Void){
        
      /*  if !validationMethodManager!.checkEmptyField(self.txtFieldUserPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterUserNameOrMobileNumberALERT, false, self.txtFieldUserPhone)
            return
            
        }else{
            if Int(self.txtFieldUserPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)) != nil{
                if !validationMethodManager!.isValidPhone(self.txtFieldUserPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)){
                    validHandler( ConstantTexts.EnterValidMobileNumberALERT, false, self.txtFieldUserPhone)
                    return
                }
            }else{
                if !validationMethodManager!.isValidUsername(self.txtFieldUserPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)){
                    validHandler( ConstantTexts.EnterUserNameALERT, false, self.txtFieldUserPhone)
                    return
                }
            }
        } */
        
        if !validationMethodManager!.checkEmptyField(self.txtFieldUserPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
              validHandler( ConstantTexts.EnterUserNameOrMobileNumberALERT, false, self.txtFieldUserPhone)
              return
              
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
        
        
        validHandler( ConstantTexts.empty, true, nil)
        return
        
        
        
    }
    
}
