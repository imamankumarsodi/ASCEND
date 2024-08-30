//
//  CustomMethodClass.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit
import Lottie
import SDWebImage
class CustomMethodClass: CustomMethodProtocol {
    //TODO: Singleton object
    static let shared = CustomMethodClass()
    private init() {}
    
    
    //TODO: Provide AttributedText
    public func provideSimpleAttributedText( text:String, font: UIFont,  color: UIColor)->NSMutableAttributedString{
        return NSMutableAttributedString(string: "\(text)", attributes:[.font: font, .foregroundColor :color])
    }
    
    
    //TODO: Provide underline AttributedText
    public func provideUnderlineAttributedText( text:String, font: UIFont, color: UIColor)->NSMutableAttributedString{
        return NSMutableAttributedString(string: "\(text)", attributes:[.font: font, .foregroundColor :color, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    
    //TODO: Show ToolTip
    func showToolTip(msg:String,anchorView:UIView,sourceView:UIView){
        let rightBottomView = TipView()
        rightBottomView.color = AppColor.redColor
        rightBottomView.textColor = AppColor.whiteColor
        rightBottomView.font = AppFont.semiBold.size(AppFontName.poppins, size: 12)
        rightBottomView.maxWidth = mainScreenWidthApp - 50
        rightBottomView.dismissClosure = { tipview in
            print("call back to there..")
        }
        // Dismiss after spwcified duration
        rightBottomView.show(message: msg,
                             sourceView: anchorView,
                             containerView: sourceView,
                             direction: .top, dismissAfterDuration: 2.0)
    }
    
    //TODO: Show ToolTip
    func showToolTipBottom(msg:String,anchorView:UIView,sourceView:UIView){
        let rightBottomView = TipView()
        rightBottomView.color = AppColor.redColor
        rightBottomView.textColor = AppColor.whiteColor
        rightBottomView.font = AppFont.semiBold.size(AppFontName.poppins, size: 12)
        rightBottomView.maxWidth = mainScreenWidthApp - 50
        rightBottomView.dismissClosure = { tipview in
            print("call back to there..")
        }
        // Dismiss after spwcified duration
        rightBottomView.show(message: msg,
                             sourceView: anchorView,
                             containerView: sourceView,
                             direction: .bottom, dismissAfterDuration: 2.0)
    }
    
    
    //TODO: Run lottie animation
    func showLottieAnimationFill(view: UIView,animationName:String,loopMode:LottieLoopMode) {
        let animationViewLottie = AnimationView(name: animationName)
        view.isUserInteractionEnabled = false
        animationViewLottie.isHidden = false
        view.clipsToBounds = true
        animationViewLottie.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        animationViewLottie.contentMode = .scaleToFill
        animationViewLottie.animationSpeed = 1
        animationViewLottie.loopMode = loopMode
        view.addSubview(animationViewLottie)
        animationViewLottie.play()
    }
    
    
    //TODO: Run lottie animation
    func showLottieAnimation(_ view: UIView,_ animationName:String, _ loopMode:LottieLoopMode) {
        let animationViewLottie = AnimationView(name: animationName)
        view.isUserInteractionEnabled = false
        animationViewLottie.isHidden = false
        view.clipsToBounds = true
        animationViewLottie.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        animationViewLottie.contentMode = .scaleAspectFit
        animationViewLottie.animationSpeed = 1
        animationViewLottie.loopMode = loopMode
        view.addSubview(animationViewLottie)
        animationViewLottie.play()
    }
    
    
    
    //MARK: - Alert Methods
    //TODO: Show alert simple
    func showAlert(_ message: String, okButtonTitle: String? = nil, target: UIViewController? = nil) {
        let topViewController: UIViewController? = self.topMostViewController(rootViewController: self.rootViewController())
        
        if let _ = topViewController {
            let alert = UIAlertController(title:ConstantTexts.AppName, message: message, preferredStyle: UIAlertController.Style.alert);
            let okBtnTitle = okButtonTitle
            let okAction = UIAlertAction(title:okBtnTitle, style: UIAlertAction.Style.default, handler: nil);
            
            alert.addAction(okAction);
            if UIApplication.shared.applicationState != .background{
                topViewController?.present(alert, animated:true, completion:nil);
            }
        }
    }
    
    
    //TODO: Show alert with cancel
    func showAlertWithCancel(title:String,message:String,btnOkTitle:String,btnCancelTitle:String,callBack:@escaping ((Bool)->())){
        
        let topViewController: UIViewController? = self.topMostViewController(rootViewController: self.rootViewController())
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: btnOkTitle, style: .default, handler: { action in
            callBack(true)
        }))
        alert.addAction(UIAlertAction(title: btnCancelTitle, style: .cancel, handler: { action in
            callBack(false)
        }))
        
        topViewController?.present(alert, animated: true)
    }
    
    //TODO: Show alert with cancel
    func showAlertWithOK(title:String,message:String,btnOkTitle:String,callBack:@escaping ((Bool)->())){
        let topViewController: UIViewController? = self.topMostViewController(rootViewController: self.rootViewController())
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: btnOkTitle, style: .default, handler: { action in
            callBack(true)
        }))
        topViewController?.present(alert, animated: true)
    }
    
    
    //TODO: Get root view controller
    func rootViewController() -> UIViewController
    {
        return UIApplication.shared.windows.first!.rootViewController ?? UIViewController()
    }
    
    
    //TODO - Get topmost view controller
    func topMostViewController(rootViewController: UIViewController) -> UIViewController? {
        if let navigationController = rootViewController as? UINavigationController
        {
            return topMostViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if let tabBarController = rootViewController as? UITabBarController
        {
            if let selectedTabBarController = tabBarController.selectedViewController
            {
                return topMostViewController(rootViewController: selectedTabBarController)
            }
        }
        
        if let presentedViewController = rootViewController.presentedViewController
        {
            return topMostViewController(rootViewController: presentedViewController)
        }
        return rootViewController
    }
    
    
    //TODO: Provide shadow, border and corner radius
    func provideShadowAndCornerRadius(_ blueView:UIView, _ cornerRadius:CGFloat,_ corners:CACornerMask,_ shadowColor: UIColor, _ shadowWidth: CGFloat, _ shadowHeight: CGFloat,_ shadowOpacity: Float, _ shadowRadius: CGFloat, _ borderWidth:CGFloat, _ borderColor: UIColor){
        // corner radius
        blueView.layer.cornerRadius = cornerRadius
        blueView.layer.maskedCorners = corners
        
        // border
        blueView.layer.borderWidth = borderWidth
        blueView.layer.borderColor = borderColor.cgColor
        
        // shadow
        blueView.layer.shadowColor = shadowColor.cgColor
        blueView.layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
        blueView.layer.shadowOpacity = shadowOpacity
        blueView.layer.shadowRadius = shadowRadius
    }
    
    
    
    func redirectToMainNavRVC(currentVC: UIViewController){
        var navigationController = UINavigationController()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = currentVC
        if #available(iOS 13.0, *){
            if let scene = UIApplication.shared.connectedScenes.first{
                guard let windowScene = (scene as? UIWindowScene) else { return }
                print(">>> windowScene: \(windowScene)")
                let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window.windowScene = windowScene //Make sure to do this
                navigationController = UINavigationController(rootViewController: vc)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
                appDelegate.window = window
            }
            
        } else {
            appDelegate.window?.rootViewController = vc
            appDelegate.window?.makeKeyAndVisible()
        }
        
    }
    
}
