//
//  TabNavigationMenu.swift
//  CustomTabNavigation
//
//  Created by Sprinthub on 14/10/2019.
//  Copyright © 2019 Sprinthub Mobile. All rights reserved.
//
// Changed by Agha Saad Rehman

//// Please Follow this tabbar classes from gtihub - https://github.com/quacklabs/customTabBarSwift

import UIKit
extension UIImage {
    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
}


extension UIImage {
    
    func tintedWithLinearGradientColors(colorsArr: [CGColor]) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1, y: -1)
        
        context.setBlendMode(.normal)
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        
        // Create gradient
        let colors = colorsArr as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)
        
        // Apply gradient
        context.clip(to: rect, mask: self.cgImage!)
        context.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: self.size.height), options: .drawsAfterEndLocation)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return gradientImage!
    }
}



extension UIView{
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}


class TabNavigationMenu: UIImageView {
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    var previousItem:Int = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // UIColor.init(red: 89/255, green: 221/255, blue: 191/255, alpha: 1.0)
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        
        print(frame)
        
        /*  self.image = UIImage(named: "tabBarbg")
         self.image = UIImage(named: "tabBarbgReverse")?.tinted(with: UIColor.init(red: 89/255, green: 221/255, blue: 191/255, alpha: 1.0)) */
        
        
        
        self.image = UIImage(named: "tabBarbgReverse")?.tintedWithLinearGradientColors(colorsArr: [AppColor.appGradientColor1.cgColor , AppColor.appGradientColor2.cgColor])
        
        //setGradientBackground(colorTop: UIColor.yellow, colorBottom: UIColor.red)
        
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        
        for index in 0 ..< menuItems.count {
            
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(index)
            
            let itemView = self.createTabItem(item: menuItems[index])
            itemView.tag = index
            
            self.addSubview(itemView)
            
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor ),
                itemView.widthAnchor.constraint(equalToConstant: itemWidth), // fixing width
                
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor) ,
            ])
            
            
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        setUpView(tab: 2)
    }
    
    func createTabItem(item: TabItem) -> UIView
    {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        let selectedItemView = UIImageView(frame: CGRect.zero)
        
        // adding tags to get views for modification when selected/unselected
        
        tabBarItem.tag = 11
        itemTitleLabel.tag = 12
        itemIconView.tag = 13
        selectedItemView.tag = 14
        //#colorLiteral(red: 0.3131835461, green: 0.6219350696, blue: 0.6471702456, alpha: 1)
        selectedItemView.backgroundColor =  #colorLiteral(red: 0.4747471809, green: 0.3194392323, blue: 0.8300455213, alpha: 1) //.black
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 50, height: 50))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 2.0
        shape.strokeColor = UIColor.black.cgColor
        selectedItemView.layer.addSublayer(shape)
        
        let gradient = CAGradientLayer()
        gradient.frame = path.bounds
        gradient.colors = [UIColor(displayP3Red:  0.4747471809, green:0.3194392323, blue: 0.8300455213, alpha: 1.0).cgColor, UIColor(displayP3Red:  0.3131835461, green: 0.6219350696, blue: 0.6471702456, alpha: 1.0).cgColor]
        
        let shapeMask = CAShapeLayer()
        shapeMask.path = path.cgPath
        gradient.mask = shapeMask
        
        selectedItemView.layer.addSublayer(gradient)
        
        selectedItemView.layer.borderWidth = 3
        selectedItemView.layer.borderColor =  #colorLiteral(red: 0.4747471809, green: 0.3194392323, blue: 0.8300455213, alpha: 1)  // #colorLiteral(red: 0.4747471809, green: 0.3194392323, blue: 0.8300455213, alpha: 1)
        
        // selectedItemView.image = UIImage(named: "selectedTab")
        
        selectedItemView.translatesAutoresizingMaskIntoConstraints = false
        selectedItemView.clipsToBounds = true
        
        tabBarItem.addSubview(selectedItemView)
        
        NSLayoutConstraint.activate([
            selectedItemView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            selectedItemView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 9),
            selectedItemView.heightAnchor.constraint(equalToConstant: 50),
            selectedItemView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        selectedItemView.layer.cornerRadius = 25
        tabBarItem.sendSubviewToBack(selectedItemView)
        
        selectedItemView.isHidden = true
        
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.font = UIFont.systemFont(ofSize: 12)
        itemTitleLabel.textColor = .clear // changing color to white
        itemTitleLabel.textAlignment = .left
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.isHidden = true // hiding label for now
        
        itemIconView.image = item.icon!.withRenderingMode(.automatic)
        itemIconView.contentMode = .scaleAspectFit // added to stop stretching
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 28), // Fixed height for our tab item(25pts) changed to 15
            itemIconView.widthAnchor.constraint(equalToConstant: 28), // Fixed width for our tab item icon changed to 15
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor, constant: 10), //
            
            itemTitleLabel.heightAnchor.constraint(equalToConstant: 13),
            
            // Fixed height for title label
            //itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor), // Position label full width across tab bar item
            
            itemTitleLabel.centerXAnchor.constraint(equalTo: itemIconView.centerXAnchor, constant: 0),
            
            // itemTitleLabel.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor, constant: 8)
            
            itemTitleLabel.bottomAnchor.constraint(equalTo: tabBarItem.bottomAnchor, constant: -10),
            
            // Position title label 4pts below item icon, s: changinf postion of label so don't need this
        ])
        
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
        return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        
        print("------------",from , to)
        
        if from != to{
            // self.deactivateTab(tab: from)
            self.activateTab(tab: to)
        }
        
    }
    
    func activateTab(tab: Int) {
        
            /*    let tabToActivate = self.subviews[tab]
        
                // showing title label on selection
                tabToActivate.viewWithTag(12)?.isHidden = false // showing label
                tabToActivate.viewWithTag(14)?.isHidden = false // showing selected tab background
        
                // changing constraints for animation
                NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
                NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerXAnchor.constraint(equalTo: tabToActivate.centerXAnchor, constant: 0)])
        
                NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerYAnchor.constraint(equalTo: tabToActivate.centerYAnchor, constant: -13)])
        
        
                NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .height}))
                NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .width}))
        
                NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.heightAnchor.constraint(equalToConstant: 30)])
                NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.widthAnchor.constraint(equalToConstant: 30)])
        
                // transform effect for selectedtab background
                UIView.animate(withDuration: 0.25, animations: {
                    tabToActivate.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.layoutIfNeeded()
                }) { (Bool) in
        
        
                    tabToActivate.viewWithTag(14)?.isHidden = false
                } */
        
        self.itemTapped?(tab)
        
        self.activeItem = tab
    }
    
    
    
    func setUpView(tab: Int){
        let tabToActivate = self.subviews[tab]
        
        
        
        // showing title label on selection
        tabToActivate.viewWithTag(12)?.isHidden = false // showing label
        tabToActivate.viewWithTag(14)?.isHidden = false // showing selected tab background
        
        // changing constraints for animation
        NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerXAnchor.constraint(equalTo: tabToActivate.centerXAnchor, constant: 0)])
        
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerYAnchor.constraint(equalTo: tabToActivate.centerYAnchor, constant: -13)])
        
        
        NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .height}))
        NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .width}))
        
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.heightAnchor.constraint(equalToConstant: 30)])
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.widthAnchor.constraint(equalToConstant: 30)])
        
        // transform effect for selectedtab background
        UIView.animate(withDuration: 0.25, animations: {
            tabToActivate.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
        }) { (bool) in
            
            
            tabToActivate.viewWithTag(14)?.isHidden = false
        }
    }
    
    func deactivateTab(tab: Int) {
        
        let inactiveTab = self.subviews[tab]
        
        // hiding label again when deselected
        inactiveTab.viewWithTag(12)?.isHidden = true
        
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .centerY}))
        
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .centerX}))
        
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.centerXAnchor.constraint(equalTo: inactiveTab.centerXAnchor)])
        
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.centerYAnchor.constraint(equalTo: inactiveTab.centerYAnchor, constant: 10)])
        
        
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .height}))
        
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .width}))
        
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.heightAnchor.constraint(equalToConstant: 20)])
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.widthAnchor.constraint(equalToConstant: 20)])
        
        /* //Deactivate height and width of tab-Icons
         NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .height}))
         
         NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .width}))
         
         //Change Height And Width of Middle Icons Like Home and other tab icons
         //Activate height and width of tab-Icons
         NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.heightAnchor.constraint(equalTo: inactiveTab.heightAnchor, constant: 20)])
         NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.widthAnchor.constraint(equalTo: inactiveTab.widthAnchor, constant: 20)]) */
        
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.25, animations: {
            inactiveTab.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.layoutIfNeeded()
        }) { (bool) in
            inactiveTab.viewWithTag(14)?.isHidden = true
        }
    }
}


public extension CAGradientLayer {
    
    /// Sets the start and end points on a gradient layer for a given angle.
    ///
    /// - Important:
    /// *0°* is a horizontal gradient from left to right.
    ///
    /// With a positive input, the rotational direction is clockwise.
    ///
    ///    * An input of *400°* will have the same output as an input of *40°*
    ///
    /// With a negative input, the rotational direction is clockwise.
    ///
    ///    * An input of *-15°* will have the same output as *345°*
    ///
    /// - Parameters:
    ///     - angle: The angle of the gradient.
    ///
    public func calculatePoints(for angle: CGFloat) {
        
        
        var ang = (-angle).truncatingRemainder(dividingBy: 360)
        
        if ang < 0 { ang = 360 + ang }
        
        let num: CGFloat = 0.5
        
        switch ang {
        
        case 0...45, 315...360:
            let aPoint = CGPoint(x: 0, y: num * tanx(ang) + num)
            let bPoint = CGPoint(x: 1, y: num * tanx(-ang) + num)
            startPoint = aPoint
            endPoint = bPoint
            
        case 45...135:
            let aPoint = CGPoint(x: num * tanx(ang - 90) + num, y: 1)
            let bPoint = CGPoint(x: num * tanx(-ang - 90) + num, y: 0)
            startPoint = aPoint
            endPoint = bPoint
            
        case 135...225:
            let aPoint = CGPoint(x: 1, y: num * tanx(-ang) + num)
            let bPoint = CGPoint(x: 0, y: num * tanx(ang) + num)
            startPoint = aPoint
            endPoint = bPoint
            
        case 225...315:
            let aPoint = CGPoint(x: num * tanx(-ang - 90) + num, y: 0)
            let bPoint = CGPoint(x: num * tanx(ang - 90) + num, y: 1)
            startPoint = aPoint
            endPoint = bPoint
            
        default:
            let aPoint = CGPoint(x: 0, y: num)
            let bPoint = CGPoint(x: 1, y: num)
            startPoint = aPoint
            endPoint = bPoint
            
        }
    }
    
    /// Private function to aid with the math when calculating the gradient angle
    private func tanx(_ cor: CGFloat) -> CGFloat {
        return tan(cor * CGFloat.pi / 180)
    }
    
    
    // Overloads
    
    /// Sets the start and end points on a gradient layer for a given angle.
    public func calculatePoints(for angle: Int) {
        calculatePoints(for: CGFloat(angle))
    }
    
    /// Sets the start and end points on a gradient layer for a given angle.
    public func calculatePoints(for angle: Float) {
        calculatePoints(for: CGFloat(angle))
    }
    
    /// Sets the start and end points on a gradient layer for a given angle.
    public func calculatePoints(for angle: Double) {
        calculatePoints(for: CGFloat(angle))
    }
    
}
