//
//  LearningAndInterestHeaderView.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import UIKit

class LearningAndInterestHeaderView: UIView {
    internal var callBackSearch:(()->())?

    @IBAction func btnSearchTapped(_ sender: UIButton) {
        self.callBackSearch?()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
