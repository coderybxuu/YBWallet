//
//  AppDelegate.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/19.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,Mnemonicable{
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //网络监控
        YBReachability.shared().monitorNet()
        //监测本地是否生成了助记词
        verification()
        window = UIWindow()
        window?.rootViewController = YBLoginController()
        window?.makeKeyAndVisible()
        UIApplication.shared.statusBarStyle = .lightContent
        
        //测试
        test()
        return true
    }
    
    func test() {
        
    }
}

