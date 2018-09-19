//
//  YBLoginViewModel.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/6.
//  Copyright © 2018年 tjsk. All rights reserved.
//

import Foundation
import Moya
class YBLoginViewModel: NSObject {
    
    func login(pwd : String,account:String,complete: @escaping ((YBLoginModel?)->Void)) {
//        SwiftProgressHUD.showOnNavigation("正在验证登录...")
//        TJNetworking.request(MultiTarget(UserApi.login(mobile: account, passwd: pwd)), success: { (JSON) in
//            let model = TJLoginModel(dict: JSON.dictionary!)
//            complete(model)
//            SwiftProgressHUD.hideAllHUD()
//        }, error: { (code) in
//            complete(nil)
//        }) { (error) in
            complete(nil)
//        }
    }
}

