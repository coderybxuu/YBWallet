//
//  YBSQWalletListManager.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/21.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import SQLite

class YBSQLiteWalletListsManager: NSObject {
    ///储存属性
    fileprivate let walletName = Expression<String>("walletName")
    fileprivate let walletAddress = Expression<String>("walletAddress")
    fileprivate let walletPrivatekey = Expression<String>("walletPrivatekey")
    fileprivate let walletMnemonic = Expression<String>("walletMnemonic")
    fileprivate let walletIsBackup = Expression<Bool>("walletIsBackup")
    fileprivate let walletListID = rowid
    
    static let `default` = YBSQLiteWalletListsManager()
    private var db: Connection!
    private var table: Table = Table("walletLists")
    
    fileprivate override init() {
        super.init()
        createdsqlite3()
    }
}

extension YBSQLiteWalletListsManager{
    //创建数据库文件
    fileprivate func createdsqlite3(filePath: String = "/Documents")  {
        
        let sqlFilePath = NSHomeDirectory() + filePath + "/walletLists.sqlite3"
        print(sqlFilePath)
        do {
            db = try Connection(sqlFilePath)
            try db.run(table.create { t in
                t.column(walletName)
                t.column(walletAddress)
                t.column(walletPrivatekey)
                t.column(walletMnemonic)
                t.column(walletIsBackup)
            })
        } catch { print(error) }
    }
}

//数据库操作
extension YBSQLiteWalletListsManager{
    
    //增
    func insert(item: YBSQWalletListModel) {
        
        do {
            let insert = table.insert(walletName <- item.walletName,
                                      walletAddress <- item.walletAddress,
                                      walletPrivatekey <- item.walletPrivatekey,
                                      walletMnemonic <- item.walletMnemonic,
                                      walletIsBackup <- item.walletIsBackup)
            try db.run(insert)
        } catch  {
            print(error)
        }
    }
    
    //删单条
    func delete(id: Int64) {
        
        delete(id: id)
    }
    
    //根据条件删除
    func delete(_ address : String = "") {
        
        let currWallet = table.filter(self.walletAddress == address)
        do {
            try db.run(currWallet.delete())
        } catch {
            print(error)
        }
        
    }
    
    //改
    func update(id: Int64, item: YBSQWalletListModel) {
        
        let update = table.filter(rowid == id)
        do {
            try db.run(update.update(walletName <- item.walletName,
                                      walletAddress <- item.walletAddress,
                                      walletPrivatekey <- item.walletPrivatekey,
                                      walletMnemonic <- item.walletMnemonic,
                                      walletIsBackup <- item.walletIsBackup))

        } catch {
            print(error)
        }
    }
    
    //查
    func search()-> [YBSQWalletListModel]{
        var walletListsModel = [YBSQWalletListModel]()
        for walletModel_row in try! db.prepare(table) {
            
            let walletModel = YBSQWalletListModel.init()
            walletModel.walletAddress = walletModel_row[walletAddress]
            walletModel.walletMnemonic = walletModel_row[walletMnemonic]
            walletModel.walletPrivatekey = walletModel_row[walletPrivatekey]
            walletModel.walletName = walletModel_row[walletName]
            walletModel.walletIsBackup = walletModel_row[walletIsBackup]
            walletListsModel.append(walletModel)
        }
        return walletListsModel
    }
    
    //按条件读取数据
    func search(name:String) -> YBSQWalletListModel? {
        var walletModel :YBSQWalletListModel?
        for walletModel_row in try! db.prepare(table.filter(self.walletName == name)) {
            walletModel = YBSQWalletListModel.init()
            walletModel?.walletAddress = walletModel_row[walletAddress]
            walletModel?.walletMnemonic = walletModel_row[walletMnemonic]
            walletModel?.walletPrivatekey = walletModel_row[walletPrivatekey]
            walletModel?.walletName = walletModel_row[walletName]
            walletModel?.walletIsBackup = walletModel_row[walletIsBackup]
        }
        return walletModel
    }
}
