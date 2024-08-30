//
//  MoreVC.swift
//  ASCEND
//
//  Created by Shivani Pandey on 23/04/21.
//

import UIKit

class MoreVC:SBaseViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    internal var customMethodManager:CustomMethodProtocol?
   
    
    internal let titleArr = [ConstantTexts.MyAccountLT,ConstantTexts.PersonalityInsightsLT, ConstantTexts.MyActivityLT, ConstantTexts.GroupsLT,ConstantTexts.PatronsLT, ConstantTexts.AmplificationsLT, ConstantTexts.DiscoverPeopleLT,ConstantTexts.SettingsLT]
    
    

    
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
     
    
}

