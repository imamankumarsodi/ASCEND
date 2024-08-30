//
//  AppTourVC+CustomMethods.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit
extension AppTourVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
    }
    
    //TODO: Intial setup implementation
    internal func initialSetup(){
      
        registerNib()
        
        
        
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        
        self.tourCollectionView.register(nib: AppTourCollectionViewCell.className)
    }
 
}
