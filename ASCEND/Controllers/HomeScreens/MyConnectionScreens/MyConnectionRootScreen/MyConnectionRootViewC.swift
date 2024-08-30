//
//  MyConnectionRootViewC.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import UIKit

class MyConnectionRootViewC: SBaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var btnSCircleRef: UIButton!
    @IBOutlet weak var viewSCircle: UIView!
    
    @IBOutlet weak var btnFollowerRef: UIButton!
    @IBOutlet weak var viewFollower: UIView!
    
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
    
    
    
    @IBAction func btnChoiceTapped(_ sender: UIButton) {
        
        if sender.tag == 0{
          
            self.btnSCircleRef.setTitleColor(AppColor.whiteColor, for: .normal)
            self.btnFollowerRef.setTitleColor(AppColor.appGradientColor2, for: .normal)
            
            self.viewFollower.isHidden = true
            self.viewSCircle.isHidden = false
        }else{
            
            self.btnSCircleRef.setTitleColor(AppColor.appGradientColor2, for: .normal)
            self.btnFollowerRef.setTitleColor(AppColor.whiteColor, for: .normal)
            
            self.viewFollower.isHidden = false
            self.viewSCircle.isHidden = true
        }
        
        self.animateScrollViewHorizontally(destinationPoint: CGPoint(x: sender.tag * Int(self.view.frame.width), y: 0), andScrollView: self.scrollView, andAnimationMargin: 0)
    }


}
