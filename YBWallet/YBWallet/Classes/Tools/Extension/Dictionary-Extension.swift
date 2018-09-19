//
//  Dictionary-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/7.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
extension Dictionary{
    //字典转字符串
    func dicValueString() -> String?{
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
    }
}
