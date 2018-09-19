//
//  Bundle-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/6.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation

///获取命名空间
extension Bundle {
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
