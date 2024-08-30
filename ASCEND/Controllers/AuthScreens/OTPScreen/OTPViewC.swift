//
//  OTPViewC.swift
//  ASCEND
//
//  Created by Aman Kumar on 22/04/21.
//

import UIKit

class OTPViewC: SBaseViewController {
   
    @IBOutlet weak var otpView: VPMOTPView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var viewProceedCBG: UIView!
    @IBOutlet weak var viewProceedRBG: UIView!
    @IBOutlet weak var viewResendBG: UIView!
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?

    internal var enteredOtp: String = ""
    
    internal var timer: Timer?
    internal var time: Int = 60
    
    internal var isComingFromForgot:Bool = Bool()
    
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
    
    //TODO: Implementation viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    
    
    //TODO: Selectors
    @objc func runTimedCode(){
        if time > 0{
            time -= 1
            lblTimer.text = (time > 9) ? "00:\(time)" : "00:0\(time)"
        }else{
            stopTimer()
        }
    }
    
    
    @IBAction func btnProceedTapped(_ sender: UIButton) {
        super.dismissKeyboard()
        userDefaultApp.set(true, forKey: ConstantTexts.tourOverUDK)
        if sender.tag == 0{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.viewProceedCBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                self.viewProceedCBG.transform = CGAffineTransform.identity
                                
                                if self.isComingFromForgot{
                                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: ResetPasswordVC.className) as? ResetPasswordVC
                                    
                                    guard let vcP = vc else{
                                        print("No ResetPasswordVC...")
                                        return
                                    }
                                    
                                    self.navigationController?.pushViewController(vcP, animated: true)
                                    
                                    
                                }else{
                                    
                                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: UpdateNumberVC.className) as? UpdateNumberVC
                                    
                                    guard let vcP = vc else{
                                        print("No UpdateNumberVC...")
                                        return
                                    }
                                    
                                    self.navigationController?.isModalInPresentation = false
                                    self.navigationController?.present(vcP, animated: true, completion: nil)
                                }
                                
                                
                            }
                           })
        }else{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.viewProceedRBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                self.viewProceedRBG.transform = CGAffineTransform.identity
                                if self.isComingFromForgot{
                                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: ResetPasswordVC.className) as? ResetPasswordVC
                                    
                                    guard let vcP = vc else{
                                        print("No ResetPasswordVC...")
                                        return
                                    }
                                    
                                    self.navigationController?.pushViewController(vcP, animated: true)
                                    
                                    
                                }else{
                                    
                                    let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: UpdateNumberVC.className) as? UpdateNumberVC
                                    
                                    guard let vcP = vc else{
                                        print("No UpdateNumberVC...")
                                        return
                                    }
                                    
                                    self.navigationController?.isModalInPresentation = false
                                    self.navigationController?.present(vcP, animated: true, completion: nil)
                                }

                            }
                           })
        }
        
        
    }

    

}
