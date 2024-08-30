//
//  LoginVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import UIKit

class LoginVC: SBaseViewController {
    
    @IBOutlet weak var txtFieldUserPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var viewLoginBg: UIView!
    @IBOutlet weak var lblAlreadyAccount: UILabel!
    
    
    
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
    
    
    //MARK: - IBActions, Gestures
    //TODO: Actions
    @IBAction func btnLoginClicked(_ sender: AnyObject) {
        super.dismissKeyboard()
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewLoginBg.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewLoginBg.transform = CGAffineTransform.identity
                            self.validateFields { (strMsg, status, anchorView) in
                                
                                if !status{
                                    
                                    if let txtView = anchorView as? UITextField{
                                        self.customMethodManager?.showToolTip(msg: strMsg, anchorView: txtView, sourceView: self.view)
                                        txtView.becomeFirstResponder()
                                    }
                                    
                                    
                                }else{
                                    //aage bhej do
                                    /* super.moveToNextViewCViaRoot(name: ConstantTexts.MainSBT, withIdentifier: NavigationMenuBaseController.className) */
                                    
                                    let vc = AppStoryboard.tabBarSB.instantiateViewController(withIdentifier: NavigationMenuBaseController.className) as! NavigationMenuBaseController
                                    UIApplication.shared.windows.first?.rootViewController = vc
                                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                                    
                                    
                                    
                                }
                                
                            }
                        }
                       })
        
        
        /*   */
    }
    
    @IBAction func btnForgotPasswordClicked(_ sender: AnyObject) {
        super.dismissKeyboard()
        let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: ForgotPasswordVC.className) as? ForgotPasswordVC
        guard let vcF = vc else {
            return
        }
        self.navigationController?.pushViewController(vcF, animated: true)
    }
    
    
    //TODO: Selectors
    //Calls this function when the tap is recognized.
    @objc func lblSignUpRefTapped(_ sender: UITapGestureRecognizer) {
        super.dismissKeyboard()
        guard let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: SignUpVC.className) as? SignUpVC else{
            print("No SignUpVC found...")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
