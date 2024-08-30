//
//  ProfileHomeTableViewCell.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import UIKit

class ProfileHomeTableViewCell: SBaseTableViewCell {
    @IBOutlet weak var collectionViewPhoto: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionViewPhoto.register(nib: PhotoCollectionViewCell.className)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
