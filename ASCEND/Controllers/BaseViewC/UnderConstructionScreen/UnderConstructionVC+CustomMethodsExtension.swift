//
//  UnderConstructionVC+CustomMethodsExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 08/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension UnderConstructionVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.empty, leftBarButtonsType: [.empty], rightBarButtonsType: [.empty])
        customTabBar.isHidden = false
       // self.tabBarController?.tabBar.isHidden = false
       
        
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        initialSetup()
    }
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.UnderConstructionLT, font: AppFont.bold.size(AppFontName.poppins, size: 18), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.WeBackSoonLT)", font: AppFont.semiBold.size(AppFontName.poppins, size: 14), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        self.descLabel.numberOfLines = 0
        self.descLabel.attributedText = myMutableString
        
        self.customMethodManager?.showLottieAnimation(self.animationView, ConstantTexts.ConstructionAnimation, .loop)
        
    }
    
    
    internal func callNavigation(){

            self.tabBarController?.navigationController?.navigationBar.isHidden = true
            self.tabBarController?.navigationItem.hidesBackButton = true

            self.navigationController?.navigationBar.isHidden = false

            //Notification Button

            let buttonNotification = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 40, height: 45)))
        
        buttonNotification.setImage(#imageLiteral(resourceName: "eye_open"), for: .normal)

         //   buttonNotification.setImage( imageLiteral(resourceName: "chats"), for: .normal)

           // buttonNotification.addTarget(self, action: #selector(tapNotification), for: .touchUpInside)

            

            let btnNoti = UIBarButtonItem(customView: buttonNotification)

            

            tabBarController?.navigationItem.rightBarButtonItems = [btnNoti]

            

            let appearance = UINavigationBarAppearance()

            appearance.configureWithTransparentBackground()

            appearance.backgroundColor = .blue

            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            

            self.tabBarController?.navigationController?.navigationBar.tintColor = .white

            self.tabBarController?.navigationController?.navigationBar.standardAppearance = appearance

            self.tabBarController?.navigationController?.navigationBar.compactAppearance = appearance

            self.tabBarController?.navigationController?.navigationBar.scrollEdgeAppearance = appearance

            

            let lblTitle = UILabel()

                    let font = UIFont.systemFont(ofSize: 14, weight: .bold)

                    let titleAttribute: [NSAttributedString.Key: Any] = [.font: font,

                                                                         .foregroundColor: UIColor.white]

            let attributeString = NSMutableAttributedString(string: "Calendar", attributes: titleAttribute)

                    lblTitle.attributedText = attributeString

                    lblTitle.sizeToFit()

                    self.tabBarController?.navigationItem.titleView = lblTitle
        
        super.isHiddenNavigationBar(false)
        super.setupNavigationBarTitle(AppColor.appColor, ConstantTexts.empty, leftBarButtonsType: [.empty], rightBarButtonsType: [.menu])

        }
  
}
