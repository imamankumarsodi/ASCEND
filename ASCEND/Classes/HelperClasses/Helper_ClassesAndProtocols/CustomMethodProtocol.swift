//
//  CustomMethodProtocol.swift
//  ASCEND
//
//  Created by Aman Kumar on 21/04/21.
//

import Foundation
import UIKit
import Lottie
protocol CustomMethodProtocol {
    //TODO: Provide AttributedText
    func provideSimpleAttributedText( text:String, font: UIFont,  color: UIColor)->NSMutableAttributedString
    
    //TODO: Provide underline AttributedText
    func provideUnderlineAttributedText( text:String, font: UIFont, color: UIColor)->NSMutableAttributedString
    
    //TODO: Show ToolTip Top
    func showToolTip(msg:String,anchorView:UIView,sourceView:UIView)
    
    //TODO: Show ToolTip Bottom
    func showToolTipBottom(msg:String,anchorView:UIView,sourceView:UIView)
    
    //TODO: Run lottie animation fill
    func showLottieAnimationFill(view: UIView,animationName:String,loopMode:LottieLoopMode)
    
    //TODO: Run lottie animation
    func showLottieAnimation(_ view: UIView,_ animationName:String, _ loopMode:LottieLoopMode)
    
    //TODO: Show alert simple
    func showAlert(_ message: String, okButtonTitle: String?, target: UIViewController?)
    
    
    //TODO: Show alert with cancel
    func showAlertWithCancel(title:String,message:String,btnOkTitle:String,btnCancelTitle:String,callBack:@escaping ((Bool)->()))
    
    //TODO: Show alert with cancel
    func showAlertWithOK(title:String,message:String,btnOkTitle:String,callBack:@escaping ((Bool)->()))
    
    //TODO - Get topmost view controller
    func topMostViewController(rootViewController: UIViewController) -> UIViewController?
    
    //TODO: Get root view controller
    func rootViewController() -> UIViewController
    
    
    //TODO: Provide shadow and corner radius
    
    func provideShadowAndCornerRadius(_ blueView:UIView, _ cornerRadius:CGFloat,_ corners:CACornerMask, _ shadowColor: UIColor, _ shadowWidth: CGFloat, _ shadowHeight: CGFloat,_ shadowOpacity: Float, _ shadowRadius: CGFloat, _ borderWidth:CGFloat, _ borderColor: UIColor)
    
    func redirectToMainNavRVC(currentVC: UIViewController)
    
}
