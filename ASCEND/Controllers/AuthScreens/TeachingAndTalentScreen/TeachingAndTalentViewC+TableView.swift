//
//  TeachingAndTalentViewC+TableView.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit
import CloudTagView
// MARK:- TableView delegate and datasource

extension TeachingAndTalentViewC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LearningAndInterestTableViewCell.className) as? LearningAndInterestTableViewCell else{
            print("No LearningAndInterestTableViewCell found...")
            return UITableViewCell()
        }
        
        if let elements = self.dataListVM?.elements{
            for item in elements{
                let withoutIconTag = TagView(text: item.title)
                withoutIconTag.iconImage = nil
                withoutIconTag.marginTop = 10
                withoutIconTag.font = AppFont.light.size(AppFontName.poppins, size: 13)
                cell.tagView.tags.append(withoutIconTag)
            }
        }
        
        return cell
    }
    
   
}

extension TeachingAndTalentViewC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer: LearningAndInterestFooterView  = Bundle.main.loadNibNamed(LearningAndInterestFooterView.className, owner: self, options: nil)?.last as! LearningAndInterestFooterView
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        
        myMutableString.append(self.customMethodManager?.provideUnderlineAttributedText(text: "\(ConstantTexts.ViewAllLT)", font: AppFont.light.size(AppFontName.poppins, size: 13), color: AppColor.whiteColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        footer.btnViewAllRef.setAttributedTitle(myMutableString, for: .normal)
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: LearningAndInterestHeaderView  = Bundle.main.loadNibNamed(LearningAndInterestHeaderView.className, owner: self, options: nil)?.first as! LearningAndInterestHeaderView
        header.callBackSearch = { [weak self] in
            guard  let strongSelf = self else {
                print("No self found")
                return
            }
            
            guard let vc = AppStoryboard.authSB.instantiateViewController(withIdentifier: SearchVC.className) as? SearchVC else{
                 print("No SearchVC found...")
                 return
             }
            strongSelf.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
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
