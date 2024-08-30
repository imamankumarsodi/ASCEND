//
//  LearningAndInterestVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import UIKit

class LearningAndInterestVC:SBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewProceedBG: UIView!
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var topicModeling: ElementDI?
    internal var dataListVM:ElementPerViewModelList?

    
    
     
   
    //MARK: - variables for the animate tableview
    internal var animationName = String()
    
    /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
    internal var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03) {
        didSet {
            self.animationName = currentTableAnimation.getTitle()
        }
    }
    internal var animationDuration: TimeInterval = 0.85
    internal var delay: TimeInterval = 0.05
    
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
    

    
    @IBAction func analyzeButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewProceedBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewProceedBG.transform = CGAffineTransform.identity
                            guard let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: TeachingAndTalentViewC.className) as? TeachingAndTalentViewC else{
                                 print("No TeachingAndTalentViewC found...")
                                 return
                             }
                             self.navigationController?.pushViewController(vc, animated: true)
                            
                        }
                       })
    }

}




