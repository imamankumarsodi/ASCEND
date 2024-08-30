//
//  AppTourVC.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import UIKit

class AppTourVC: SBaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewProceedBG: UIView!
    @IBOutlet weak var buttonSkipRef: UIButton!
    @IBOutlet weak var buttonProceedRef: UIButton!
    @IBOutlet weak var buttonPrevRef: UIButton!
    @IBOutlet weak var buttonNextRef: UIButton!
    
    
    @IBOutlet weak var tourCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Variables
    internal var tourArray:[String] = [ConstantTexts.ANewLT,ConstantTexts.SocialCoLT,ConstantTexts.MmunityLT]
    
    internal var currIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navSetup()
    }
    
    
    //MARK: - IBActions, Gestures
    //TODO: Actions
    
    
    
    @IBAction func nextPageButtonClicked(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.buttonNextRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.buttonNextRef.transform = CGAffineTransform.identity
                            self.currIndex = self.pageControl.currentPage + 1
                            print(self.currIndex)
                            let indexPath = IndexPath(item: 0, section: self.currIndex)
                            self.tourCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
                        }
                       })
        
        
        /*   */
    }
    
    
    @IBAction func prevPageButtonClicked(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.buttonPrevRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.buttonPrevRef.transform = CGAffineTransform.identity
                            self.currIndex = self.pageControl.currentPage - 1
                            print(self.currIndex)
                            let indexPath = IndexPath(item: 0, section: self.currIndex)
                            self.tourCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                        }
                       })
        
        /*   */
    }
    
    @IBAction func btnProceedTapped(_ sender: UIButton) {
        userDefaultApp.set(true, forKey: ConstantTexts.tourOverUDK)
        if sender.tag == 0{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.buttonSkipRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                self.buttonSkipRef.transform = CGAffineTransform.identity
                                super.moveToNextViewCViaRoot(name: ConstantTexts.AuthSBT, withIdentifier: LoginVC.className)
                            }
                           })
        }else{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.viewProceedBG.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                self.viewProceedBG.transform = CGAffineTransform.identity
                                super.moveToNextViewCViaRoot(name: ConstantTexts.AuthSBT, withIdentifier: LoginVC.className)
                            }
                           })
        }
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
