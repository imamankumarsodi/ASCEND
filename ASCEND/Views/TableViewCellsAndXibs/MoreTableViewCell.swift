//
//  MoreTableViewCell.swift
//  ASCEND
//
//  Created by Shivani Pandey on 23/04/21.
//

import UIKit

class MoreTableViewCell: SBaseTableViewCell {

    @IBOutlet weak var moreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func configure(with info:String){
        self.moreLabel.text = info
    }

}
