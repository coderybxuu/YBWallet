//
//  YBNetworkable.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/7.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
import Alamofire

//网络监测
class YBReachability{
    fileprivate static let reachabilityManager : NetworkReachabilityManager = {
        let shared = NetworkReachabilityManager()
        return shared!
    }()
    class func shared() -> NetworkReachabilityManager {
        return reachabilityManager
    }
}

extension NetworkReachabilityManager{
    
    func start(){
        YBReachability.shared().startListening()
    }
    
    func stop(){
        YBReachability.shared().stopListening()
    }
    
    func monitorNet() {

        YBReachability.shared().listener = { status in
            
            switch status {
            case .notReachable:
                  window?.makeToast("网络异常")
                  return 
            case .unknown:
                  window?.makeToast("未知网络")
            case  .reachable(.ethernetOrWiFi):
                  YBLog("网络正常-WIFi")
            case .reachable(.wwan):
                  window?.makeToast("您当前使用数据流量")
            }

        }
        start()
    }
}


//临时请求时间
func getServerTimes(time_S: @escaping (_ time:String)->(Void)){
    
    let url:URL = URL(string: baseUrl + timestamp)!
    let urlRequest:URLRequest = URLRequest(url: url)
    var response:URLResponse?
    
    do{
        let data = try NSURLConnection.sendSynchronousRequest(urlRequest, returning: &response)
        let json = try JSON(data: data)
        let time = json["result"]["timestmap"]
        time_S("\(time)")
        
    }catch let error as NSError{
        print(error.description)
    }
}

