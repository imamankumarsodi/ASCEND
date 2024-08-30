//
//  SocialCircleViewC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit

extension SocialCircleViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        customTabBar.isHidden = true
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
      
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        self.registerNib()
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tableView.register(nib: MyConnectionTableViewCell.className)
        self.tableView.hideEmptyCells()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
        }
        
        guard  let viewC = AppStoryboard.popUpsSB.instantiateViewController(withIdentifier: HowItWorksPopupViewC.className) as? HowItWorksPopupViewC else {
            print("No HowItWorksPopupViewC found...")
            return
        }
        viewC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(viewC, animated: true, completion: nil)
    }
}
