//
//  NavigationMenuBaseController+UITabBarControllerDelegate.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import Foundation
import UIKit
extension NavigationMenuBaseController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}


