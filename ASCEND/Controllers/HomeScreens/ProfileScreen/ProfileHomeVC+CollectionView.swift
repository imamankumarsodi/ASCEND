//
//  ProfileHomeVC+CollectionView.swift
//  ASCEND
//
//  Created by Aman Kumar on 29/04/21.
//

import Foundation
import UIKit
// MARK: - UICollectionViewDataSource extension
extension ProfileHomeVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.className, for: indexPath) as? PhotoCollectionViewCell else{
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
       
        return cell
    }
}



//MARK: - UICollectionViewDelegate extension
extension ProfileHomeVC:UICollectionViewDelegate{
   
    
    
 
}

//MARK: - UICollectionViewDelegateFlowLayout extension
extension ProfileHomeVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 107, height: collectionView.frame.size.height)
        
        
    }
}
