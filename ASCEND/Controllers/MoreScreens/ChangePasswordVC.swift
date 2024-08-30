//
//  ChangePasswordVC.swift
//  ASCEND
//
//  Created by Shivani Pandey on 23/04/21.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet var validatePasswordLabel: [UILabel]!
    @IBOutlet weak var currentPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var currentIcon: UIImageView!
    @IBOutlet weak var newIcon: UIImageView!
    @IBOutlet weak var confirmIcon: UIImageView!
    @IBOutlet weak var updateButton: UIButton!
    
    let specialCharacters = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{2,}$")
    let oneCap = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[A-Z]).{1,}$")
    let oneNumb = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9]).{1,}$")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButton.cornerRadius = updateButton.frame.height/2
    }
    
    //MARK:- TextField's Action
    
    @IBAction func passwordTFAction(_ sender: UITextField) {
        if oneCap.evaluate(with: sender.text){
            validatePasswordLabel[0].textColor = UIColor.black
            validatePasswordLabel[1].textColor = UIColor.black
        }
        if oneNumb.evaluate(with: sender.text){
            validatePasswordLabel[2].textColor = UIColor.black
            validatePasswordLabel[3].textColor = UIColor.black
        }
        if specialCharacters.evaluate(with: sender.text){
            validatePasswordLabel[4].textColor = UIColor.black
            validatePasswordLabel[5].textColor = UIColor.black
        }
        if sender.text!.count >= 8{
            validatePasswordLabel[6].textColor = UIColor.black
            validatePasswordLabel[7].textColor = UIColor.black
        }
        if !oneCap.evaluate(with: sender.text){
            validatePasswordLabel[0].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            validatePasswordLabel[1].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if !oneNumb.evaluate(with: sender.text){
            validatePasswordLabel[2].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            validatePasswordLabel[3].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if !specialCharacters.evaluate(with: sender.text){
            validatePasswordLabel[4].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            validatePasswordLabel[5].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if sender.text!.count < 8{
            validatePasswordLabel[6].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            validatePasswordLabel[7].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
    
    //MARK:- Button's Action
    
    @IBAction func backButtonACtion(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func currentButtonAction(_ sender: UIButton) {
        if sender.tag == 0{
            sender.tag = 1
            currentIcon.image = #imageLiteral(resourceName: "eye_open")
            currentPasswordTF.isSecureTextEntry = false
        }else{
            sender.tag = 0
            currentIcon.image = #imageLiteral(resourceName: "eye_close")
            currentPasswordTF.isSecureTextEntry = true
        }
    }
    
    @IBAction func newButtonAction(_ sender: UIButton) {
        if sender.tag == 0{
            sender.tag = 1
            newIcon.image = #imageLiteral(resourceName: "eye_open")
            newPasswordTF.isSecureTextEntry = false
        }else{
            sender.tag = 0
            newIcon.image = #imageLiteral(resourceName: "eye_close")
            newPasswordTF.isSecureTextEntry = true
        }
    }
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        if sender.tag == 0{
            sender.tag = 1
            confirmIcon.image = #imageLiteral(resourceName: "eye_open")
            confirmPasswordTF.isSecureTextEntry = false
        }else{
            sender.tag = 0
            confirmIcon.image = #imageLiteral(resourceName: "eye_close")
            confirmPasswordTF.isSecureTextEntry = true
        }
    }
    
    @IBAction func updatePasswordButtonAction(_ sender: UIButton) {
        
    }
    
}
