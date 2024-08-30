//
//  SelectReasonPopupViewC+TableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 01/05/21.
//

import Foundation
import UIKit
// MARK:- TableView delegate and datasource

extension SelectReasonPopupViewC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArr.count
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

extension SelectReasonPopupViewC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40

    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        self.header.lblTitle.text = "\(ConstantTexts.ReportCLT)\n\n\(ConstantTexts.SelectReasonLT)"
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            if let vc = self.viewC{
                guard let vcS = AppStoryboard.popUpsSB.instantiateViewController(withIdentifier: FeedbackSuccessPopupViewC.className) as? FeedbackSuccessPopupViewC  else{
                    print("No FeedbackSuccessPopupViewC found..")
                    return
                }
                vc.navigationController?.present(vcS, animated: true, completion: nil)
            }
        }
    }
 
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
