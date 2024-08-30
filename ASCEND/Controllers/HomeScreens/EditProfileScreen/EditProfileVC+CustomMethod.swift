//
//  EditProfileVC+CustomMethod.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit


extension EditProfileVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.EditProfileHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
        customTabBar.isHidden = true
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
        
       
        
        //create the Toolbar for Cancel and Done buttons
        createUIToolBar()
        
        //set date picker mode
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        //iOS 14 or greater
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        self.txtMonth.inputView = datePicker
        self.txtMonth.inputAccessoryView = pickerToolbar
        
        self.txtDate.inputView = datePicker
        self.txtDate.inputAccessoryView = pickerToolbar
        
        self.txtYear.inputView = datePicker
        self.txtYear.inputAccessoryView = pickerToolbar
        
    }
    
    
    func createUIToolBar() {
        
        pickerToolbar = UIToolbar()
        pickerToolbar?.autoresizingMask = .flexibleHeight
        
        //customize the toolbar
        pickerToolbar?.barStyle = .default
        pickerToolbar?.barTintColor = AppColor.appColor
        pickerToolbar?.backgroundColor = AppColor.whiteColor
        pickerToolbar?.isTranslucent = true
        
        //add buttons
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:
                                            #selector(self.cancelBtnClicked(_:)))
        cancelButton.tintColor = UIColor.white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:
                                            #selector(self.doneBtnClicked(_:)))
        doneButton.tintColor = UIColor.white
        
        //add the items to the toolbar
        pickerToolbar?.items = [cancelButton, flexSpace, doneButton]
        
    }
    
}


//MARK: - Validation methods
extension EditProfileVC{
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
        
        
        if !validationMethodManager!.checkEmptyField(self.txtFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterFirstNameALERT, false, self.txtFirstName)
            return
            
        }else{
            
            if !validationMethodManager!.isValidFullName(self.txtFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)){
                validHandler( ConstantTexts.EnterValidFirstNameALERT, false, self.txtFirstName)
                return
            }
            
        }
        
        
        if !validationMethodManager!.checkEmptyField(self.txtLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterLastNameALERT, false, self.txtLastName)
            return
            
        }else{
            
            if !validationMethodManager!.isValidFullName(self.txtLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)){
                validHandler( ConstantTexts.EnterValidLastNameALERT, false, self.txtLastName)
                return
            }
            
        }
        
        if !validationMethodManager!.checkEmptyField(self.txtCountryCode.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.SelectCountryCodeALERT, false, self.txtCountryCode)
            return
            
        }
        
        
        if !validationMethodManager!.checkEmptyField(self.txtPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.EnterPhoneNumberALERT, false, self.txtPhone)
            return
            
        }
        
        if !validationMethodManager!.checkEmptyField(self.txtMonth.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.SelectMonthALERT, false, self.txtMonth)
            return
            
        }
        
        if !validationMethodManager!.checkEmptyField(self.txtDate.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.SelectDayALERT, false, self.txtDate)
            return
            
        }
        
        
        if !validationMethodManager!.checkEmptyField(self.txtYear.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
            validHandler( ConstantTexts.SelectYearALERT, false, self.txtYear)
            return
            
        }
        
        
        
        validHandler( ConstantTexts.empty, true, nil)
        return
        
        
        
    }
    
}


