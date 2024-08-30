//
//  OtherProfileViewC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
//import CloudTagView

extension OtherProfileViewC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, "melissa_george", leftBarButtonsType: [.back], rightBarButtonsType: [.more])
        customTabBar.isHidden = true
        
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
        
        super.goToReport = { [weak self] in
            guard let vcS = AppStoryboard.popUpsSB.instantiateViewController(withIdentifier: ReportPoupViewC.className) as? ReportPoupViewC  else{
                print("No ReportPoupViewC found..")
                return
            }
            
            if let strongSelf = self{
                vcS.viewC = strongSelf
                strongSelf.navigationController?.present(vcS, animated: true, completion: nil)
            }
            
            
            
        }
    }
}
