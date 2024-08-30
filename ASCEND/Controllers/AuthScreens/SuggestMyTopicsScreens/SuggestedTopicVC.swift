//
//  SuggestedTopicVC.swift
//  ASCEND
//
//  Created by Shivani Pandey on 22/04/21.
//

import UIKit

class SuggestedTopicVC: SBaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnaAboutMyPersonalityRef: UIButton!
    @IBOutlet weak var viewProceedBG: UIView!
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var topicModeling: ElementDI?
    internal var dataListVM:ElementPerViewModelList?

    
    
    internal let footer: PersonalityAssesmentFooterView  = Bundle.main.loadNibNamed(PersonalityAssesmentFooterView.className, owner: self, options: nil)?.last as! PersonalityAssesmentFooterView
   
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
    

    @IBAction func tellMeButtonAction(_ sender: UIButton) {
       guard let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: MyPersonalityScreenViewC.className) as? MyPersonalityScreenViewC else{
            print("No MyPersonalityScreenViewC found...")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func analyzeButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.viewProceedBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.viewProceedBG.transform = CGAffineTransform.identity
                            
                            guard let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: LearningAndInterestVC.className) as? LearningAndInterestVC else{
                                 print("No LearningAndInterestVC found...")
                                 return
                             }
                             self.navigationController?.pushViewController(vc, animated: true)
                         
                            
                        }
                       })
    }

}




