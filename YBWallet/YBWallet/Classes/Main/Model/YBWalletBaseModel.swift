//
//  YBWalletBaseModel.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/13.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation

//swift4.0必须添加objcMembers才可以使用KVC字典转模型，否则失败
@objcMembers
class YBWalletBaseModel: NSObject {
    
    init(dict : [String : Any]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
