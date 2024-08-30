//
//  ReportPoupViewC.swift
//  ASCEND
//
//  Created by Aman Kumar on 01/05/21.
//

import UIKit

class ReportPoupViewC: SBaseViewController {
    
    
    @IBOutlet weak var viewTableBG: UIView!
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
    
    
    @IBAction func btnReportTapped(_ sender: UIButton) {
        self.dismiss(animated: true) {
            if let vc = self.viewC{
                guard let vcS = AppStoryboard.popUpsSB.instantiateViewController(withIdentifier: SelectReasonPopupViewC.className) as? SelectReasonPopupViewC  else{
                    print("No SelectReasonPopupViewC found..")
                    return
                }
                vcS.viewC = vc
                vc.navigationController?.present(vcS, animated: true, completion: nil)
            }
        }
       
    }

}




