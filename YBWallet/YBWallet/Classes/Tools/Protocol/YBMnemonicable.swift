//
//  Mnemonicable.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/10.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
import TrustCore

protocol Mnemonicable {
    
}

extension Mnemonicable where Self : AppDelegate{
    
    func verification() {
        let rootWordList = YBKeychain.shared().getData(key: ROOT_WORDS)

        guard let _ = rootWordList else{
            let mnemonic = Crypto.generateMnemonic(strength: 128)

            let hdWallet = HDWallet(mnemonic: mnemonic, passphrase: "")
            
            do{
                guard let rootPath =  DerivationPath(ETH_ROOTPARTH) else{return}
                print(rootPath.description)
                let rootHDKey = hdWallet.getKey(at: rootPath)
                 let rootPrivateKey = rootHDKey.description
                 let rootAddress = rootHDKey.publicKey(for: .ethereum).address.description
                
                 YBKeychain.shared().saveData(dataStr: mnemonic, key: ROOT_WORDS)
                 YBKeychain.shared().saveData(dataStr: rootAddress, key: ROOT_ADDRESS)
                 YBKeychain.shared().saveData(dataStr: rootPrivateKey, key: ROOTKEY)
            }
            return
        }
    }
}

protocol YBCreatWalletable {
    
}

extension YBCreatWalletable{
    
    func creatWallet(_ passphrase:String,name:String)  {
        let mnemonic = Crypto.generateMnemonic(strength: 128)
        let hdWallet = HDWallet(mnemonic: mnemonic, passphrase: passphrase)
        let privateKey_HD = hdWallet.getKey(at: Coin.ethereum.derivationPath(at: 0))
        let privateKey = privateKey_HD.description
        let address = privateKey_HD.publicKey(for: .ethereum).address.description
        let walletModel = YBSQWalletListModel.init()
        walletModel.walletName = name
        walletModel.walletIsBackup = false
        walletModel.walletPrivatekey = privateKey
        walletModel.walletMnemonic = mnemonic
        walletModel.walletAddress = address
        YBSQLiteWalletListsManager.default.insert(item: walletModel)
    }
    
}
