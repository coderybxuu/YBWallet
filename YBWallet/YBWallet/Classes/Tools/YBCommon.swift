//
//  common.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/6.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

//主框架颜色（项目主色调）
let kMainColor = UIColor(r: 79, g: 166, b: 223)

//navigationBar的文字颜色
let kNavTextColor = UIColor.white
let kTableBarTextColor = UIColor.orange

//main控制器json文件名
let kMainVcInfon = "YBMainViewControllerSetting.json"
//币种
let kCurrenciesType = "YBCurrenciesType.json"
let kTJkeyChainService = "com.tjsk.TJWallet"

//设备宽高
let kScreenH = UIScreen.main.bounds.size.height
let kScreenW = UIScreen.main.bounds.size.width
let kScreenS = UIScreen.main.bounds.size

// 判断是否为 iPhone X
let isIphoneX = kScreenH >= 812 ? true : false

// 状态栏高度
let kStatuHeight : CGFloat = 20
// 导航栏高度
let kNavigationBarHeight :CGFloat =  isIphoneX ? 68 : 44

// TabBar高度
let kTabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49
let CateItemHeight = kScreenW / 4
let kCateTitleH : CGFloat = 42

//获取window
let window = UIApplication.shared.keyWindow

//一些常用固定的Key
let ROOTKEY = "ROOTKEY"
let ROOT_ADDRESS = "ROOT_ADDRESS"
let ROOT_WORDS = "ROOT_WORDS"
let ETH_ROOTPARTH = "m/0'/0'/0'/1/0"
let BTC_ROOTPARTH = "m/44'/0'/0'/0/0"
let USER_TOKEN = "USER_TOKEN"

//自定义节点的一些常量
let isDefaul = "isDefaul"
let node = "node"
let defaulStr = "默认节点"
let nodeStr = "https://ropsten.infura.io/TOHkOHXU7NOlcd2L90iR"
let ERC20Adress = "0xfafd82fb10544b1f2876c593aa11085a3b2c4d07"

//屏幕的宽高比
func current_w(width:CGFloat) -> CGFloat {
    return width / 375.0 * kScreenW
}

func current_h(height:CGFloat) -> CGFloat {
    return height / 667.0 * kScreenH
}

//数据库表名
let kWalletListsSqlTableName = "kWalletListsSqlTableName"
//临时
let imageName = ""

