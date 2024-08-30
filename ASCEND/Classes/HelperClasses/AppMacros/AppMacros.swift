//
//  AppMacros.swift
//  Lawyer
//
//  Created by Aman Kumar on 18/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit

let notificationCenterApp = NotificationCenter.default
let fileManagerApp = FileManager.default
let bundleMainApp = Bundle.main
let mainThreadApp = Thread.main
let mainScreenApp = UIScreen.main
let mainScreenWidthApp = UIScreen.main.bounds.width
let mainScreenHeightApp = UIScreen.main.bounds.height
let userDefaultApp = UserDefaults.standard
let applicationApp = UIApplication.shared
let currentDeviceApp = UIDevice.current
let mainRunLoopApp = RunLoop.main
let genralPasteBoardApp = UIPasteboard.general
let currentLanguageApp = NSLocale.current.languageCode
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let statusBarDefaultHeightApp = 20
let navigationBarDefaultHeightApp = 44
let navigationBarButtonDefaultWidthApp = 40.0
let edgeInsetApp = CGFloat(10.0)
let toolBarDefaultHeightApp = 44
let tabBarDefaultHeightApp = 49
let acceptableCharacterApp = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "

//TODO: Network
let kNoInterNet = "No internet"

//TODO: Application informations

let appBundleName = bundleMainApp.infoDictionary?[kCFBundleNameKey as String]
let appName = "ASCEND"
let appLink = "https://www.hackingwithswift.com/articles/118/uiactivityviewcontroller-by-example"
let appVersion = bundleMainApp.object(forInfoDictionaryKey: "CFBundleVersion")
let inSimulatorApp = (TARGET_IPHONE_SIMULATOR != 0)
let isNewCodeApp = false


var screenNameApp:String =  String()
