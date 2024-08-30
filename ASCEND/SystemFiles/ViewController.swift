//
//  ViewController.swift
//  ASCEND
//
//  Created by Aman Kumar on 19/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for family in UIFont.familyNames {
             print("\(family)")

             for name in UIFont.fontNames(forFamilyName: family) {
                 print("\(name)")
             }
         }
    }
}
