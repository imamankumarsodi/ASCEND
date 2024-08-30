//
//  SBaseViewController.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class SBaseViewController: UIViewController {
    //MARK: - Variables
    internal let myPickerController = UIImagePickerController()
    internal var getDocCallBack:((_ item : DocumentDataModel)->())?
    internal var goToReport:(()->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    //TODO: Implementation touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismissKeyboard()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    //MARK: - Actions, Selectors, Gestures
    //TODO:  selectors
    
    @objc func navigationButtonTapped(_ sender: AnyObject) {
        guard let buttonType = UINavigationBarButtonType(rawValue: sender.tag) else {
            return }
        
        switch buttonType {
        case .backRoot:
          /*  let vc = AppStoryboard.tabBarSB.instantiateViewController(withIdentifier: TabBarVC.className) as! TabBarVC
            vc.selectedIndex = 1
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible() */
        print("send back to root...")
        case .menu:
            guard let vcS = AppStoryboard.moreSB.instantiateViewController(withIdentifier: MoreVC.className) as? MoreVC  else{
                print("No OTPViewC found..")
                return
            }
            self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
        case .more:
            self.goToReport?()
           
            
        case .back: self.navigationBarButtonDidTapped(buttonType)
        case .empty: print("do nothing...")
            
        }
    }
    
    
    
}
