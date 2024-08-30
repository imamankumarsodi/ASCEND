//
//  ProfileHomeVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit
//import CloudTagView

extension ProfileHomeVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, "Jeffrey_Reed007", leftBarButtonsType: [.empty], rightBarButtonsType: [.menu])
        customTabBar.isHidden = false
        
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.topicModeling == nil {
            self.topicModeling = SuggestedTopicVM.shared
        }
        
        if  self.dataListVM == nil{
            self.dataListVM = self.topicModeling?.prepareDataSourceStatic()
        }
       
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        
        
     
        self.registerNib()
        

    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tableView.registerMultiple(nibs: [LearningAndInterestTableViewCell.className,ProfileHomeTableViewCell.className])
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
        }
    }
}
