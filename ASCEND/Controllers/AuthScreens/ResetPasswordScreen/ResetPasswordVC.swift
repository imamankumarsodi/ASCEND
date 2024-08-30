//
//  ResetPasswordVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 23/04/21.
//

import UIKit

class ResetPasswordVC: SBaseViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var btnCreatePasswordRef: UIButton!
    @IBOutlet weak var btnConfirmPasswordRef: UIButton!
    
    @IBOutlet weak var viewProceedBG: UIView!
    @IBOutlet weak var lblUpperCaseLowerCase: UILabel!
    @IBOutlet weak var lblNumericCase: UILabel!
    @IBOutlet weak var lblSpecialChar: UILabel!
    @IBOutlet weak var lblCharLength: UILabel!
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?
    
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        self.initValues()
        
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navSetup()
    }
    
    //TODO: Selectors
    //Calls this function when the tap is recognized.
    @objc func lblSignUpRefTapped(_ sender: UITapGestureRecognizer) {
        super.dismissKeyboard()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnCreatePassWordEyeTapped(_ sender: UIButton) {
        self.txtPassword.isSecureTextEntry = !self.txtPassword.isSecureTextEntry
        let image = self.txtPassword.isSecureTextEntry ? #imageLiteral(resourceName: "eye_open") : #imageLiteral(resourceName: "eye_close")
        self.btnCreatePasswordRef.setImage(image, for: .normal)
        
    }
    
    @IBAction func btnConfirmPassWordEyeTapped(_ sender: UIButton) {
        self.txtConfirmPassword.isSecureTextEntry = !self.txtConfirmPassword.isSecureTextEntry
        let image = self.txtConfirmPassword.isSecureTextEntry ? #imageLiteral(resourceName: "eye_open") : #imageLiteral(resourceName: "eye_close")
        self.btnConfirmPasswordRef.setImage(image, for: .normal)
        
    }
    
    
    
    
    //MARK: - IBActions, Gestures
    //TODO: Actions
    @IBAction func btnConfirmdedClicked(_ sender: AnyObject) {
        super.dismissKeyboard()
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewProceedBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewProceedBG.transform = CGAffineTransform.identity
                            self.validateFields { (strMsg, status, anchorView) in
                                
                                if !status{
                                    
                                    if let txtView = anchorView as? UITextField{
                                        self.customMethodManager?.showToolTip(msg: strMsg, anchorView: txtView, sourceView: self.view)
                                        txtView.becomeFirstResponder()
                                    }else{
                                        if strMsg == ConstantTexts.EnterSamePasswordALERT{
                                            self.customMethodManager?.showAlert(strMsg, okButtonTitle: ConstantTexts.OkBT, target: self)
                                        }
                                    }
                                    
                                   
                                }else{
                                    self.customMethodManager?.showAlertWithOK(title: ConstantTexts.AppName, message: ConstantTexts.PasswordChangeSuccessfulyALERT, btnOkTitle: ConstantTexts.OkBT, callBack: { (status) in
                                        self.navigationController?.popToRootViewController(animated: true)
                                    })
                                    
                                }
                                
                            }
                        }
                       })
        
        
        /*   */
    }

}
