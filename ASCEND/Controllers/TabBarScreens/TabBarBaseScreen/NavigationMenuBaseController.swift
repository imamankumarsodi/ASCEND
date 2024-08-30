//
//  NavigationMenuBaseController.swift
//  ASCEND
//
//  Created by Aman Kumar on 28/04/21.
//

import UIKit

weak var customTabBar: TabNavigationMenu!
class NavigationMenuBaseController:  UITabBarController {
    
    
    internal var tabBarHeight: CGFloat = 90.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        let fakeTraits = UITraitCollection(horizontalSizeClass: .regular)
        return UITraitCollection(traitsFrom: [realTraits, fakeTraits])
    }
    
    private func loadTabBar() {
        let tabItems: [TabItem] = [.home, .explore, .create, .chats , .profiles ]
        self.setupCustomTabBar(tabItems) { (controllers) in
            self.viewControllers = controllers
            
        }
        self.selectedIndex = 0 // default our selected index to the first item
    }
    
    // Build the custom tab bar and hide default
    private func setupCustomTabBar(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void){
        let frame = CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.x , width: tabBar.frame.width, height: tabBarHeight) // had to change from let frame = tabBar.frame because the default height of 49 was being passed instead of 67. The background wasn't fitting correctly so had to incrrease height by 1. Not quite sure why...
        
        
        print(UIScreen.main.bounds)
        var controllers = [UIViewController]()
        
        // hide the tab bar
        tabBar.isHidden = true
        
        customTabBar = TabNavigationMenu(menuItems: items, frame: frame)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = self.changeTab
        /* self.customTabBar.setGradientBackground(colorTop: UIColor.yellow, colorBottom: UIColor.red)
         customTabBar.image = UIImage(named: "tabBarbg")
         customTabBar.isUserInteractionEnabled = true */
        
        
        // Add it to the view
        self.view.addSubview(customTabBar)
        
        
        
        // Add positioning constraints to place the nav menu right where the tab bar should be
        NSLayoutConstraint.activate([
            
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        
        print(customTabBar.frame)
        for index in 0 ..< items.count {
            controllers.append(items[index].viewController) // we fetch the matching view controller and append here
        }
        
        self.view.layoutIfNeeded() // important step
        completion(controllers) // setup complete. handoff here
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
        
        print("selected: \(self.selectedIndex) ")
        print("controller: \(self.viewControllers![self.selectedIndex])")
        
        
        
    }
    
 
}
