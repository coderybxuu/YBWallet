//
//  YBLoginController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/5.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

class YBLoginController: YBBaseViewController {
    ///登录的View
    fileprivate lazy var loginView : YBLoginView = {
        
        let loginView = YBLoginView(frame: view.frame)
        loginView.delegate = self
        return loginView
    }()
    
    ///视图模型
    fileprivate lazy var viewModel = YBLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
    }
}

extension YBLoginController : YBloginViewAble{
    func login() {
        //验证账号
        guard let pwd = self.loginView.pwdTextField.textField.text, let account = self.loginView.accountTextField.textField.text,!(pwd.isEmpty || account.isEmpty) else {
            
            //切换主控制器
            let tabBarController = YBMainViewController()
            let transtition = CATransition.yb_getTransition()
            AppDelegate.currentWindow.layer.add(transtition, forKey: "animation")
            AppDelegate.currentWindow.rootViewController = tabBarController
            
            window?.makeToast("输入有误")
            return
        }
        
        //请求登录数据
        if  YBReachability.shared().isReachable {
            viewModel.login(pwd: pwd, account: account) { (model) in
                //本地保存相关用户数据
                
                //切换主控制器
                let tabBarController = YBMainViewController()
                let transtition = CATransition.yb_getTransition()
                UIApplication.shared.keyWindow?.layer.add(transtition, forKey: "animation")
                UIApplication.shared.keyWindow?.rootViewController = tabBarController
            }
        } else{window?.makeToast("网络错误")}
    }
    
    func forget() {
        print("忘记密码")
    }
    
    func registered() {
        print("注册")
    }
}

