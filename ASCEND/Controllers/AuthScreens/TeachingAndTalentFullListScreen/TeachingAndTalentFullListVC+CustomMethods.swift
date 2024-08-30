//
//  TeachingAndTalentFullListVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit
import CloudTagView

extension TeachingAndTalentFullListVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.TeachingAndTaHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
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
        self.tableView.register(nib: LearningAndInterestTableViewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
        }
    }
}
