//
//  YBKeyChain-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/7.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//  钥匙串数据操作

import Foundation
import CryptoSwift

//单例
extension YBKeychain{
    
    fileprivate static let keyChain : YBKeychain = {
        let shared = YBKeychain(service: kTJkeyChainService)
        return shared
    }()
    class func shared() -> YBKeychain {
        return keyChain
    }
}

//数据的操作
extension YBKeychain{
    
    //保存数据
    func saveData(dataStr:String,key:String) {
       do {
           //使用AES-128-ECB加密模式
           let aes = try AES(key: Padding.zeroPadding.add(to: key.bytes, blockSize: AES.blockSize), blockMode:ECB() as BlockMode )
        
           //开始加密
           let encrypted = try aes.encrypt(dataStr.bytes)
        
           guard let data = encrypted.toBase64() else{return}
        
           try YBKeychain.shared().set(data, key: key)
        
       }catch{window?.makeToast("储存数据失败！")}
 
    }
    
    //取出数据
    func getData(key:String) ->String?{
        do {
            let aes = try AES(key: Padding.zeroPadding.add(to: key.bytes, blockSize: AES.blockSize), blockMode:ECB() as BlockMode )
            //开始解密
            
            guard let dataStr = try YBKeychain.shared().getString(key) else{return nil}
            
            guard let data = Data(base64Encoded: dataStr, options: Data.Base64DecodingOptions.init(rawValue: 0)) else{return nil}
            
            let decrypted = try aes.decrypt(data.bytes)
            
            return String(data: Data(decrypted), encoding: .utf8)!

        } catch {return nil }
        
    }
    
    //删除数据
   @discardableResult func removeData(key:String) ->Bool{
        do{
            try YBKeychain.shared().remove(key)
            return true
        }catch{return false}
    }
    
    //删除数据
    @discardableResult func removeAllData() ->Bool{
        do{
            try YBKeychain.shared().removeAll()
            return true
        }catch{return false}
    }
}
