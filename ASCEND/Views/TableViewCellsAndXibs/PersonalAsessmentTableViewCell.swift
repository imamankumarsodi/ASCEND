//
//  PersonalAsessmentTableViewCell.swift
//  ASCEND
//
//  Created by Shivani Pandey on 22/04/21.
//

import UIKit

class PersonalAsessmentTableViewCell: SBaseTableViewCell {

    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
