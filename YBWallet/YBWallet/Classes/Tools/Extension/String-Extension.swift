//
//  String-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/7.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
extension String{
    
    //根据空格字符串转数组
    static func stringToArray(str:String) ->Array<Any> {
        let strArray = str.components(separatedBy: " ")
        return strArray
    }
    
    //根据空格数组转字符串
    static func arrayToString(array:[String]) ->String {
         let arryStr = array.joined(separator: " ")
        return arryStr
    }
}
