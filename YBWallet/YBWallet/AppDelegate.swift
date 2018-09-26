//
//  AppDelegate.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/19.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,Mnemonicable{
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //网络监控
        YBReachability.shared().monitorNet()
        window = UIWindow()
        window?.rootViewController = YBCustomNavigationController(rootViewController: YBWelcomController())
        window?.makeKeyAndVisible()
        UIApplication.shared.statusBarStyle = .lightContent
        
        return true
    }
}

extension AppDelegate {
    
    static var currentDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static var currentWindow: UIWindow {
        return currentDelegate.window!
    }
    
}

