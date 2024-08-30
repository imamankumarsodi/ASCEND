//
//  ForgotPasswordVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 23/04/21.
//

import UIKit
import ADCountryPicker

class ForgotPasswordVC: SBaseViewController {
    
    @IBOutlet weak var txtCountryCode: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var viewProceedBG: UIView!

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func btnCountryCodeTapped(_ sender: UIButton) {
        super.dismissKeyboard()
        let picker = ADCountryPicker()
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
        picker.didSelectCountryWithCallingCodeClosure = { name, code, dialCode in
            print(dialCode)
            self.txtCountryCode.text = dialCode
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    @IBAction func btnProceedTapped(_ sender: UIButton) {
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
                                    }
                                    
                                    
                                }else{
                                    
                                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: OTPViewC.className) as? OTPViewC
                                    
                                    guard let vcS = vc as? OTPViewC else{
                                        print("No OTPViewC found..")
                                        return
                                    }
                                    
                                    vcS.isComingFromForgot = true
                                    
                                    self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
                                }
                                
                            }
                            
                        }
                       })
        
        
        
    }

}
