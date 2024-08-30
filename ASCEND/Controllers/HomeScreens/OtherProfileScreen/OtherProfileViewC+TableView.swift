//
//  OtherProfileViewC+TableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
import CloudTagView
// MARK:- TableView delegate and datasource

extension OtherProfileViewC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LearningAndInterestTableViewCell.className) as? LearningAndInterestTableViewCell else{
                print("No LearningAndInterestTableViewCell found...")
                return UITableViewCell()
            }
            
            cell.tagView.tags.removeAll()
            
            if let elements = self.dataListVM?.elements{
                for item in elements{
                    if isLearningTapped{
                       
                        let withoutIconTag = TagView(text: item.title)
                        withoutIconTag.iconImage = nil
                        withoutIconTag.marginTop = 10
                        withoutIconTag.font = AppFont.light.size(AppFontName.poppins, size: 13)
                        cell.tagView.tags.append(withoutIconTag)
                        
                        
                    }else{
                       
                        
                        
                        let withoutIconTag = TagView(text: "\(item.title) {\(item.count)}")
                        withoutIconTag.iconImage = nil
                        withoutIconTag.marginTop = 10
                        withoutIconTag.font = AppFont.light.size(AppFontName.poppins, size: 13)
                        cell.tagView.tags.append(withoutIconTag)
                    }
                    
                    
                }
            }
            
            return cell
        }else{
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileHomeTableViewCell.className) as? ProfileHomeTableViewCell else{
                print("No ProfileHomeTableViewCell found...")
                return UITableViewCell()
            }
            
            cell.collectionViewPhoto.delegate = self
            cell.collectionViewPhoto.dataSource = self
            DispatchQueue.main.async {
                cell.collectionViewPhoto.reloadData()
            }
            return cell
            
        }
       
    }
    
   
}

extension OtherProfileViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            let footer: ProfileHomeFooterView  = Bundle.main.loadNibNamed(ProfileHomeFooterView.className, owner: self, options: nil)?.last as! ProfileHomeFooterView
            
          
            
            return footer
        }else{
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 40
        }else{
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let header: OtherProfileHeaderView  = Bundle.main.loadNibNamed(OtherProfileHeaderView.className, owner: self, options: nil)?.first as! OtherProfileHeaderView
            
            
            // *** Create instance of `NSMutableParagraphStyle`
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            // *** set LineSpacing property in points ***
            paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
            
            var myMutableString = NSMutableAttributedString()
            
            myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "Love guiding people through the flows of life. When I am not skateboarding… ", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
            
            
            myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.MoreLT)", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
            
            // *** Apply attribute to string ***
            myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
            // *** Set Attributed String to your label ***
            
            header.lblPersonDetail.attributedText = myMutableString
            
            
            
          
            var paragraphStyleCenter = NSMutableParagraphStyle()
            paragraphStyleCenter.alignment = .center
            // *** set LineSpacing property in points ***
            paragraphStyleCenter.lineSpacing = 5 // Whatever line spacing you want in points
            
            myMutableString = NSMutableAttributedString()
            myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.ViewAllLT)", font: AppFont.light.size(AppFontName.poppins, size: 12), color: AppColor.whiteColor) ?? NSMutableAttributedString())
            
            // *** Apply attribute to string ***
            myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyleCenter, range:NSMakeRange(0, myMutableString.length))
            // *** Set Attributed String to your label ***
            
            header.btnViewAllRef.setAttributedTitle(myMutableString, for: .normal)
            
            
            
            header.btnTeachingRef.addTarget(self, action: #selector(btnTeachingTapped), for: .touchUpInside)
            header.btnLearningRef.addTarget(self, action: #selector(btnLearningTapped), for: .touchUpInside)
            
            header.btnExpertieseRef.addTarget(self, action: #selector(btnExpertiseTapped), for: .touchUpInside)

            
            if isLearningTapped{
                header.lblTeaching.textColor = AppColor.appGradientColor2
                header.lblLearning.textColor = AppColor.whiteColor
                header.viewTeaching.isHidden = true
                header.viewLearning.isHidden = false
            }else{
                header.lblTeaching.textColor = AppColor.whiteColor
                header.lblLearning.textColor = AppColor.appGradientColor2
                header.viewTeaching.isHidden = false
                header.viewLearning.isHidden = true
            }
            
           
            
            
            return header
        }else{
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 450
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
   
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
