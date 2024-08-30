//
//  SearchVC+UITableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit
// MARK:- TableView delegate and datasource

extension SearchVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataListVM?.numberOfSections ?? 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataListVM?.numberOfRowsInSection(section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let elements = self.dataListVM?.elements{
            if !elements.isEmpty{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.className) as? SearchTableViewCell else{
                    print("No SearchTableViewCell found...")
                    return UITableViewCell()
                }
                
                if let dataModel = self.dataListVM?.elementAt(indexPath.row) {
                    cell.configure(with: dataModel)
                }
                
                
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchEmptyTableViewCell.className) as? SearchEmptyTableViewCell else{
                    print("No SearchEmptyTableViewCell found...")
                    return UITableViewCell()
                }
                
                
                return cell
                
                
            }
        }else{
            let cell = UITableViewCell()
            cell.backgroundColor = AppColor.appColor
            return cell
            
            
        }
        
       
    }
    
   
}

extension SearchVC: UITableViewDelegate{
    
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
  
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
