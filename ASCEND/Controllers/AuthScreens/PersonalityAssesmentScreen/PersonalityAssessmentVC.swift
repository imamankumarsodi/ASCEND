//
//  PersonalityAssessmentVC.swift
//  ASCEND
//
//  Created by Shivani Pandey on 22/04/21.
//

import UIKit

class PersonalityAssessmentVC: SBaseViewController {
    @IBOutlet weak var buttonSkipRef: UIButton!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var viewProceedBG: UIView!

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



    //MARK:- Button Action
    
   
    @IBAction func skipButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.buttonSkipRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.buttonSkipRef.transform = CGAffineTransform.identity
                           // super.moveToNextViewCViaRoot(name: ConstantTexts.AuthSBT, withIdentifier: LoginVC.className)
                            
                            
                            
                        }
                       })
    }
    
    @IBAction func analyzeButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewProceedBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewProceedBG.transform = CGAffineTransform.identity
                            let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: SuggestedTopicVC.className) as? SuggestedTopicVC
                            
                            guard let vcP = vc else{
                                print("No SuggestedTopicVC...")
                                return
                            }
                            
                            self.navigationController?.pushViewController(vcP, animated: true)
                            
                        }
                       })
    }
}
