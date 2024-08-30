//
//  EditProfileVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import UIKit
import ADCountryPicker

class EditProfileVC: SBaseViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtCountryCode: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtMonth: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var viewProceedBG: UIView!
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?
    
    internal var pickerToolbar: UIToolbar?
    internal var datePicker = UIDatePicker()
    
    
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
                                    
                                    guard let vcS = AppStoryboard.authSB.instantiateViewController(withIdentifier: UserNameAndPasswordVC.className) as? UserNameAndPasswordVC  else{
                                        print("No OTPViewC found..")
                                        return
                                    }
                                    
                                   
                                    
                                    self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
                                }
                                
                            }
                            
                        }
                       })
        
        
        
    }
    
    
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
    
    
    
    @IBAction func btnMonthTapped(_ sender: UIButton) {
        super.dismissKeyboard()
        self.txtMonth.becomeFirstResponder()
    }
    
    @IBAction func btnDateTapped(_ sender: UIButton) {
        super.dismissKeyboard()
        self.txtDate.becomeFirstResponder()
    }
    
    @IBAction func btnYearTapped(_ sender: UIButton) {
        super.dismissKeyboard()
        self.txtYear.becomeFirstResponder()
    }
    
    
    //TODO: Selectors
    //Calls this function when the tap is recognized.
    @objc func lblSignUpRefTapped(_ sender: UITapGestureRecognizer) {
        super.dismissKeyboard()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        super.dismissKeyboard()
        // dateTextField?.resignFirstResponder()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let array = formatter.string(from: datePicker.date).components(separatedBy: "/")
        self.txtMonth.text = array[0]
        self.txtDate.text = array[1]
        self.txtYear.text = array[2]
        
        self.txtMonth.resignFirstResponder()
        self.txtDate.resignFirstResponder()
        self.txtYear.resignFirstResponder()
        
        
    }
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        super.dismissKeyboard()
        self.txtMonth.resignFirstResponder()
    }
    
    
    
    
}
