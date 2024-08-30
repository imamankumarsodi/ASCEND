//
//  VisibleViewC+UITableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
// MARK:- TableView delegate and datasource

extension VisibleViewC: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VisibleTableViewCell.className) as? VisibleTableViewCell else{
            print("No VisibleTableViewCell found...")
            return UITableViewCell()
        }
        
        return cell
    }
    
   
}

extension VisibleViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
         guard let vcS = AppStoryboard.homeSB.instantiateViewController(withIdentifier: ChangePasswordViewC.className) as? ChangePasswordViewC  else{
             print("No ChangePasswordViewC found..")
             return
         }
         self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
        }
        /*else if indexPath.row == 1{
            
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
