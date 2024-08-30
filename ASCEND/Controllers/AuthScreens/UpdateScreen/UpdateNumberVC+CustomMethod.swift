//
//  UpdateNumberVC+CustomMethod.swift
//  ASCEND
//
//  Created by Aman Kumar on 22/04/21.
//

import Foundation
import UIKit


extension UpdateNumberVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(true)
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
        self.customMethodManager?.showLottieAnimationFill(view: self.animationView, animationName: ConstantTexts.HaloAnimation, loopMode: .loop)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
