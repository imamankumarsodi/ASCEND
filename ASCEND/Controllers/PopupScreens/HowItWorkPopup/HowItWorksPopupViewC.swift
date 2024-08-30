//
//  HowItWorksPopupViewC.swift
//  ASCEND
//
//  Created by Aman Kumar on 01/05/21.
//

import UIKit

class HowItWorksPopupViewC:SBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewProceedBG: UIView!
    @IBOutlet weak var viewTableBG: UIView!
    internal var customMethodManager:CustomMethodProtocol?
    
    internal let header: SearchHeader  = Bundle.main.loadNibNamed(SearchHeader.className, owner: self, options: nil)?.first as! SearchHeader

    
    
   
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
                         
                            self.dismiss(animated: true, completion: nil)
                        }
                       })
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}




