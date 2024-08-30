//
//  AppTourCollectionViewCell.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import UIKit

class AppTourCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    public func configure(with info:String,row:Int){
        self.lblDesc.text = info
        if row == 0 || row == 1{
            self.lblDesc.textAlignment = .right
        }else{
            self.lblDesc.textAlignment = .left
        }
    }
    
}
