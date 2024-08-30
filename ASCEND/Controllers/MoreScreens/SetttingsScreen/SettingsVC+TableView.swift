//
//  SettingsVC+TableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 30/04/21.
//

import Foundation
import UIKit
// MARK:- TableView delegate and datasource

extension SettingsVC: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.className) as? MoreTableViewCell else{
            print("No MoreTableViewCell found...")
            return UITableViewCell()
        }
        
        cell.configure(with:self.titleArr[indexPath.row])
        
        return cell
    }
    
   
}

extension SettingsVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            guard let vcS = AppStoryboard.moreSB.instantiateViewController(withIdentifier: PrivacyAndSecurityVC.className) as? PrivacyAndSecurityVC  else{
                print("No OTPViewC found..")
                return
            }
            self.navigationController?.pushViewController(vcS, animated: true)//aage bhej do
        }else if indexPath.row == 1{
            
        }else if indexPath.row == 2{
            
        }else if indexPath.row == 3{
            
        }else{
           
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
  
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
