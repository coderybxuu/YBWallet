//
//  YBLog.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/7.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
//MARK:-  =============自定义log===============
func YBLog<T>(_ message:T,file:String = #file,funcName:String = #function,lineName:Int = #line){
    #if DEBUG
    let  flieName = (file as NSString).lastPathComponent
    print("文件名：\(flieName) 方法名：\(funcName) 行数：\(lineName) : \(message)")
    #endif
}
