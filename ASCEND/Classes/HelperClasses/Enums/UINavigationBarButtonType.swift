//
//  UINavigationBarButtonType.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
//MARK: - For UINavigationBarButtonType
enum UINavigationBarButtonType: Int {
    
    case back
    case backRoot
    case empty
    case menu
    case more
    
    //TODO : Set images according to UINavigationBarButtonType
    var iconImage: UIImage? {
        switch self {
        case .backRoot: return #imageLiteral(resourceName: "back")
        case .back: return #imageLiteral(resourceName: "back")
        case .menu: return #imageLiteral(resourceName: "hamburger")
        case .more: return #imageLiteral(resourceName: "more")
        case .empty: return UIImage()
        }
    }
}


