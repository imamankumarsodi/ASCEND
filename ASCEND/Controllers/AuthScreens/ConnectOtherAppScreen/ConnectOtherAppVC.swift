//
//  ConnectOtherAppVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 23/04/21.
//

import UIKit

class ConnectOtherAppVC: SBaseViewController {

    
    @IBOutlet weak var viewProceedBG: UIView!
    
    @IBOutlet weak var viewFaceBookBG: UIView!
    @IBOutlet weak var viewTwitterBG: UIView!
    
    
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
    @IBAction func btnConfirmdedClicked(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewProceedBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewProceedBG.transform = CGAffineTransform.identity
                            let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: PersonalityAssessmentVC.className) as? PersonalityAssessmentVC
                            
                            guard let vcP = vc else{
                                print("No PersonalityAssessmentVC...")
                                return
                            }
                            
                            self.navigationController?.pushViewController(vcP, animated: true)
                            
                        }
                       })
        
        
        /*   */
    }
    
    @IBAction func btnFaceBookClicked(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewFaceBookBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewFaceBookBG.transform = CGAffineTransform.identity
                            
                        }
                       })
        
        
        /*   */
    }
    
    @IBAction func btnTwitterClicked(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewTwitterBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewTwitterBG.transform = CGAffineTransform.identity
                            
                        }
                       })
        
        
        /*   */
    }

}
