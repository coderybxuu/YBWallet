//
//  YBWalletModel.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/12.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

class YBWalletModel : YBWalletBaseModel {

    var iconView : String?
    var typeTitle : String?
    
    override var description: String{
        return ("\(String(describing: iconView)) -- \(String(describing: typeTitle))")
    }
}


