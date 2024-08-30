//
//  AppTourVC+UICollectionView.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit
// MARK: - UICollectionViewDataSource extension
extension AppTourVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.tourArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppTourCollectionViewCell.className, for: indexPath) as? AppTourCollectionViewCell else{
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        cell.configure(with: self.tourArray[indexPath.section], row: indexPath.section)
        return cell
    }
}



//MARK: - UICollectionViewDelegate extension
extension AppTourVC:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.tourCollectionView.frame.size.width
        pageControl.currentPage = Int(self.tourCollectionView.contentOffset.x / pageWidth)
        self.buttonProceedRef.tag = Int(self.tourCollectionView.contentOffset.x / pageWidth)
        
        if pageControl.currentPage == 0{
            
            if self.viewProceedBG.alpha == 1{
                UIView.animate(withDuration: 0.2) {
                    self.viewProceedBG.alpha = 0
                    self.buttonProceedRef.alpha = 0
                }
                self.viewProceedBG.isHidden = true
                self.buttonProceedRef.isHidden = true
            }
            
            
            if self.buttonPrevRef.alpha == 1{
                UIView.animate(withDuration: 0.2) {
                    self.buttonPrevRef.alpha = 0
                }
                self.buttonPrevRef.isHidden = true
            }
            
            self.buttonNextRef.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.buttonNextRef.alpha = 1
            }
            
            
        }else if pageControl.currentPage == 1{
            
            if self.viewProceedBG.alpha == 1{
                UIView.animate(withDuration: 0.2) {
                    self.viewProceedBG.alpha = 0
                    self.buttonProceedRef.alpha = 0
                }
                self.viewProceedBG.isHidden = true
                self.buttonProceedRef.isHidden = true
            }
            
            self.buttonPrevRef.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.buttonPrevRef.alpha = 1
            }
            
            self.buttonNextRef.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.buttonNextRef.alpha = 1
            }
            
            
        }else{
            self.buttonPrevRef.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.buttonPrevRef.alpha = 1
            }
            
            
            if self.buttonNextRef.alpha == 1{
                UIView.animate(withDuration: 0.2) {
                    self.buttonNextRef.alpha = 0
                }
                self.buttonNextRef.isHidden = true
            }
            
            self.viewProceedBG.isHidden = false
            self.buttonProceedRef.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.viewProceedBG.alpha = 1
                self.buttonProceedRef.alpha = 1
    
            }
            
            
            
        }
        
    }
    
 
}

//MARK: - UICollectionViewDelegateFlowLayout extension
extension AppTourVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if mainScreenHeightApp > 736{
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height + 44)
        }else{
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height + 20)
        }
        
        
    }
}
