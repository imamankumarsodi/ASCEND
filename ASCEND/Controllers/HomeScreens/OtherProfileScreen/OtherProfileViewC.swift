//
//  OtherProfileViewC.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import UIKit

class OtherProfileViewC: SBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    
    internal var customMethodManager:CustomMethodProtocol?
    internal var topicModeling: ElementDI?
    internal var dataListVM:ElementPerViewModelList?

    internal var isLearningTapped:Bool = Bool()
    
     
   
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
    
   

    @objc func btnTeachingTapped(_ sender: UIButton) {
        self.isLearningTapped = Bool()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    @objc func btnLearningTapped(_ sender: UIButton) {
        self.isLearningTapped = true
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    @objc func btnExpertiseTapped(_ sender: UIButton) {
        guard let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: ExpertiseRootViewC.className) as? ExpertiseRootViewC else{
             print("No ExpertiseRootViewC found...")
             return
         }
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func btnEditProfileTapped(_ sender: UIButton) {
        guard let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: EditProfileVC.className) as? EditProfileVC else{
             print("No EditProfileVC found...")
             return
         }
         self.navigationController?.pushViewController(vc, animated: true)
    }
    

}




