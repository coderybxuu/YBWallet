//
//  YBWallletViewModel.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/13.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//  处理单条cell模型数据

import UIKit

//CustomStringConvertible可以轻量级的调用description
class YBWallletViewModel:CustomStringConvertible {
    
    var walletModel : YBWalletModel
    
    init(model:YBWalletModel) {
        walletModel = model
        //这里处理模型中的不实际的数据
    }
    
    var description: String{
        return walletModel.description
    }
}
