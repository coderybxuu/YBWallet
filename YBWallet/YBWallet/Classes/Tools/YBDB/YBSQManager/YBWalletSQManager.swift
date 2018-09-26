//
//  YBWalletSQManager.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/26.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import SQLite

class YBWalletSQManager {
    
    //属性
    fileprivate var walletName = Expression<String>("walletName")
    fileprivate var walletPwd = Expression<String>("walletPwd")
    fileprivate var walletAddress = Expression<String>("walletAddress")
    fileprivate var walletPrivatekey = Expression<String>("walletPrivatekey")
    fileprivate var walletMnemonic = Expression<String>("walletMnemonic")
    fileprivate var walletIsBackup = Expression<Bool>("walletIsBackup")
   
    fileprivate var walletID = rowid
    
    
    //创建单例
    static let shared           = YBWalletSQManager()
    
    fileprivate var database: Connection!
    
    fileprivate var walletTable: Table = Table("walletLists")
    
    fileprivate init() {
        createdSqlite3()
    }
    
    //初始化db
    func createdSqlite3(){
        
        let sqlFilePath = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
        print(sqlFilePath)
        do {
            database = try Connection("\(sqlFilePath)/walletLists.sqlite3")
            try database.run(walletTable.create { t in
//                t.column(walletID, primaryKey: true)
                t.column(walletName,unique: true)
                t.column(walletAddress)
                t.column(walletPwd)
                t.column(walletMnemonic)
                t.column(walletPrivatekey)
                t.column(walletIsBackup)
                
            })
        } catch { print(error) }
    }
}
    
//数据库操作
extension YBWalletSQManager{
   
    //增
    func insert(_ model: YBSQWalletListModel) {
        do {
            let insert = walletTable.insert(walletName <- model.walletName,
                                            walletMnemonic <- model.walletMnemonic,
                                            walletPwd <- model.walletPwd,
                                            walletAddress <- model.walletAddress,
                                            walletIsBackup <- model.walletIsBackup,
                                            walletPrivatekey <- model.walletPrivatekey)
            let row = try database.run(insert)
            print(row)
        
        } catch {
            print(error)
        }
    }
    
    //删单条
    func delete(_ id: Int64) {
        let currWallet = walletTable.filter(rowid == id)
        do {
            try database?.run((currWallet.delete()))
        } catch {
            print(error)
        }
    }
    
    //根据条件删除
    func delete(_ walletName: String) {
        
        let currWallet = walletTable.filter(self.walletName == walletName)
        do {
            try database.run((currWallet.delete()))
        } catch {
            print(error)
        }
    }
    
    //改
    func update(_ model: YBSQWalletListModel) {
        
        let currWallet = walletTable.filter(self.walletName == model.walletName)
        if let count = try? database.run(currWallet.update(
            walletName <- model.walletName,
            walletMnemonic <- model.walletMnemonic,
            walletPwd <- model.walletPwd,
            walletAddress <- model.walletAddress,
            walletIsBackup <- model.walletIsBackup,
            walletPrivatekey <- model.walletPrivatekey)) {
            print("修改的结果为：\(count == 1)")
        } else {
            print("修改失败")
        }
    }
    
    //查所有
    func search() ->[YBSQWalletListModel] {
        var wallteModels = [YBSQWalletListModel]()
        for wallet_row in try! database.prepare(walletTable) {
            let walletModel = YBSQWalletListModel.init()
            walletModel.walletName = wallet_row[walletName]
            walletModel.walletIsBackup = wallet_row[walletIsBackup]
            walletModel.walletPrivatekey = wallet_row[walletPrivatekey]
            walletModel.walletMnemonic = wallet_row[walletMnemonic]
            walletModel.walletPwd = wallet_row[walletPwd]
            walletModel.walletAddress = wallet_row[walletAddress]
           
            wallteModels.append(walletModel)
        }
        return wallteModels
    }
    
    //条件查
    func search(_ walletName: String) ->YBSQWalletListModel? {
        let walletModel = YBSQWalletListModel.init()
        for wallet_row in try! database.prepare(walletTable.filter(self.walletName == walletName)) {
            
            walletModel.walletName = wallet_row[self.walletName]
            walletModel.walletIsBackup = wallet_row[walletIsBackup]
            walletModel.walletPrivatekey = wallet_row[walletPrivatekey]
            walletModel.walletMnemonic = wallet_row[walletMnemonic]
            walletModel.walletPwd = wallet_row[walletPwd]
            walletModel.walletAddress = wallet_row[walletAddress]
        }
        return walletModel
    }
}
