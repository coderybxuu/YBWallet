//
//  YBSQModel.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/25.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import Foundation

class YBSQWalletListModel{
    
    ///钱包模型
    var walletName : String = ""
    var walletPwd : String = ""
    var walletAddress : String = ""
    var walletPrivatekey : String = ""
    var walletMnemonic : String = ""
    //0未备份   1已经备份
    var walletIsBackup : String = "0"

}
