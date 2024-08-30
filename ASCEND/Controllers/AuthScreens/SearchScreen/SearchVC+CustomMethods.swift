//
//  SearchVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit

extension SearchVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.SearchTopicsHT, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
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
        self.tableView.registerMultiple(nibs: [SearchTableViewCell.className,SearchEmptyTableViewCell.className])
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
            
        }
    }
}
