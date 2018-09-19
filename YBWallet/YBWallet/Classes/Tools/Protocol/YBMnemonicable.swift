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
