//
//  SocialCircleViewC+TableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
// MARK:- TableView delegate and datasource

extension SocialCircleViewC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 4
        }else{
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyConnectionTableViewCell.className) as? MyConnectionTableViewCell else{
            print("No VisibleTableViewCell found...")
            return UITableViewCell()
        }
        
        if indexPath.section == 0{
            cell.btnAddCancelRef.setTitle(ConstantTexts.RemoveBT, for: .normal)
            cell.btnAddCancelRef.setBackgroundImage(UIImage(), for: .normal)
            
        }else{
            cell.btnAddCancelRef.setTitle(ConstantTexts.AddBT, for: .normal)
            cell.btnAddCancelRef.setBackgroundImage(#imageLiteral(resourceName: "ascend_CTA"), for: .normal)
        }
        
        return cell
    }
    
   
}

extension SocialCircleViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vcS = AppStoryboard.homeSB.instantiateViewController(withIdentifier: OtherProfileViewC.className) as? OtherProfileViewC  else{
            print("No OtherProfileViewC found..")
            return
        }
        self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
        
        /* if indexPath.row == 0{
         guard let vcS = AppStoryboard.homeSB.instantiateViewController(withIdentifier: ChangePasswordViewC.className) as? ChangePasswordViewC  else{
             print("No ChangePasswordViewC found..")
             return
         }
         self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
        }
        else if indexPath.row == 1{
            
        }else if indexPath.row == 2{
            
        }else if indexPath.row == 3{
            
        }else if indexPath.row == 4{
            
        }else if indexPath.row == 5{
            
        }else if indexPath.row == 6{
            
        }else{
            guard let vcS = AppStoryboard.moreSB.instantiateViewController(withIdentifier: SettingsVC.className) as? SettingsVC  else{
                print("No OTPViewC found..")
                return
            }
            self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
        } */
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let header: SocialCircleHeaderView  = Bundle.main.loadNibNamed(SocialCircleHeaderView.className, owner: self, options: nil)?.first as! SocialCircleHeaderView
            return header
        }else{
            let header: SearchHeader  = Bundle.main.loadNibNamed(SearchHeader.className, owner: self, options: nil)?.first as! SearchHeader
            header.lblTitle.text = ConstantTexts.SuggestionsLT
            return header
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0{
            return 250
        }else{
            return 40
        }
        
       
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
  
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
