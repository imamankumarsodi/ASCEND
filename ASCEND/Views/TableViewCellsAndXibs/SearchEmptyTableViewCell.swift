//
//  SearchEmptyTableViewCell.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import UIKit

class SearchEmptyTableViewCell: SBaseTableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func configure(with info:ElementPerViewModel){
        lblTitle.text = info.title
    }
    
}
