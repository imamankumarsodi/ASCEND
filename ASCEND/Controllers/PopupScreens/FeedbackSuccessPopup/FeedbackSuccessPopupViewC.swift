//
//  FeedbackSuccessPopupViewC.swift
//  ASCEND
//
//  Created by Aman Kumar on 01/05/21.
//

import UIKit

class FeedbackSuccessPopupViewC:SBaseViewController {
    
    
    @IBOutlet weak var viewTableBG: UIView!
    @IBOutlet weak var animationView: UIView!
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var viewC:UIViewController?
   
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
    

 
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}




