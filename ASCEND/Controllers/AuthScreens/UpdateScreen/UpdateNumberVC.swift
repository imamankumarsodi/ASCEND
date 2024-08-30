//
//  UpdateNumberVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 22/04/21.
//

import UIKit

class UpdateNumberVC:SBaseViewController {
   
    @IBOutlet weak var animationView: UIView!
    
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
    
    //TODO: Implementation viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

}
