//
//  MyAccountVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import UIKit

class MyAccountVC:SBaseViewController {
    
    @IBOutlet weak var btnExploreRef: UIButton!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var viewWallet: UIView!
    
    internal var customMethodManager:CustomMethodProtocol?
   

    
    
  
    
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
    

    @IBAction func btnWalletAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewWallet.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewWallet.transform = CGAffineTransform.identity
                            guard let vcS = AppStoryboard.homeSB.instantiateViewController(withIdentifier: MyWalletVC.className) as? MyWalletVC  else{
                                print("No OTPViewC found..")
                                return
                            }
                            self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
                            
                        }
                       })
    }

}




