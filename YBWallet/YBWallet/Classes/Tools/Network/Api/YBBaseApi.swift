//
//  YBBaseApi.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/13.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import TrustCore

protocol YBBaseApiable {
}

extension YBBaseApiable {
    var yb_BaseURL: URL {
        return URL(string: baseUrl)!
    }
    
    var path: String {
        
        return ""
    }
    
    var method: Moya.Method{
        
        return .post
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        
        return .requestParameters(parameters: [:],
                                  encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}

//头文件签名
extension YBBaseApiable{
    
      func getHeaders(method:String = "POST",parth:String,isHaveparameter:Bool,parameters : [String : Any]? = nil) -> HTTPHeaders? {
        var time : String = ""
        
        getServerTimes { (timestr) -> (Void) in
            time = timestr
        }
        
        YBLog(time)
        
        if time == "" {
            window?.makeToast("请求失败")
        }
        guard let address = YBKeychain.shared().getData(key: ROOT_ADDRESS),
            let token = YBKeychain.shared().getData(key: USER_TOKEN),
            let key_str = YBKeychain.shared().getData(key: ROOTKEY) else{return nil}
        
        var msg = ""
        if !isHaveparameter {
            msg = method + "|" + "/" + parth + "|" + time + "|"
        }else{
            guard  let dicstr =  parameters?.dicValueString(),
                let hashData = Data(hexString: (dicstr.sha3(.keccak256))) else{return nil}
            let hash = EncodeString(hashData.bytes)
            msg = method + "|" + "/" + parth + "|" + time + "|" + hash
        }
        
        guard let hashdata = Data(hexString: msg.sha3(.keccak256)),
            let key_data = Data(hexString: key_str)
            else {return nil}
        let result =  Crypto.sign(hash: hashdata, privateKey:key_data)
        let signature  = "0x" + (result.dataTostring())
        
        let headers: HTTPHeaders = [
            "User-ID-Address": address,
            "User-Timestamp": time,
            "User-Signature": signature,
            "User-Token ": token,
            ]
        return headers
    }
}

