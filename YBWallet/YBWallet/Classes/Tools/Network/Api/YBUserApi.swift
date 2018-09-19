//
//  UserApi.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/13.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
import Moya
enum UserApi : YBBaseApiable{
    
    case login(mobile: String, passwd: String)
    case register(mobile: String, passwd: String, code:String )

}

extension UserApi : TargetType {
    
    var baseURL: URL {
        return yb_BaseURL
    }
    
    var path: String {
        
        return ""
    }
    
    var method: Moya.Method{
        
        return .post
    }
    
    var task: Task {
        
        return .requestParameters(parameters: [:],
                                  encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
