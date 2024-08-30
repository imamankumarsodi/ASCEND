//
//  TabItem.swift
//  CustomTabNavigation
//
//  Created by Sprinthub on 09/10/2019.
//  Copyright © 2019 Sprinthub Mobile. All rights reserved.
//

// Changed by Agha Saad Rehman

import UIKit

enum TabItem: String, CaseIterable {
    case home        = "home"
    case explore     = "explore"
    case create      = "create"
    case chats       = "chats"
    case profiles    = "profiles"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: ProfileHomeVC.className) as! ProfileHomeVC
            
            // create the NavigationController with my VC as root
            let navCon = UINavigationController(rootViewController: vc)
            
            return navCon
        case .explore:
            let vc = AppStoryboard.mainSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            
            // create the NavigationController with my VC as root
            let navCon = UINavigationController(rootViewController: vc)
            
            return navCon
        case .create:
            let vc = AppStoryboard.mainSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            
            // create the NavigationController with my VC as root
            let navCon = UINavigationController(rootViewController: vc)
            
            return navCon
        case .chats:
            let vc = AppStoryboard.mainSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            
            // create the NavigationController with my VC as root
            let navCon = UINavigationController(rootViewController: vc)
            
            return navCon
        case .profiles:
            let vc = AppStoryboard.mainSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            
            // create the NavigationController with my VC as root
            let navCon = UINavigationController(rootViewController: vc)
            
            return navCon
        }
        
        
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "home")!
        case .explore:
            return UIImage(named: "explore")!
        case .create:
            return UIImage(named: "create")!
        case .chats:
            return UIImage(named: "chats")!
        case .profiles:
            return UIImage(named: "profiles")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
