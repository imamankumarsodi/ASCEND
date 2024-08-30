//
//  LearningAndInterestTableViewCell.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import UIKit
import CloudTagView

class LearningAndInterestTableViewCell: SBaseTableViewCell {
    @IBOutlet weak var tagView: CloudTagView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
