//
//  Data-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/10.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation

extension Data{
    
    func dataTostring() -> String {
        return self.map { String(format: "%02hhx", $0) }.joined()
    }
}
