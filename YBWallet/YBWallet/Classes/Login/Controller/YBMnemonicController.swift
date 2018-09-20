//
//  YBMnemonicController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/19.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

class YBMnemonicController: YBBaseViewController {

    fileprivate lazy var mnemonicBtnGroups : YBGroupButton = {
        let mnemonicBtnGroups = YBGroupButton.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        mnemonicBtnGroups.titleTextFont = .systemFont(ofSize: 14)
        mnemonicBtnGroups.titleLabHeight = 30;
        mnemonicBtnGroups.titleTextColor = .red
        mnemonicBtnGroups.isSingle = false
        mnemonicBtnGroups.isDefaultChoice = false
        mnemonicBtnGroups.delegate = self
        return mnemonicBtnGroups
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let title = ["助记词"]
        let mnemonic = [String.stringToArray(str: YBKeychain.shared().getData(key: ROOT_WORDS)!)]
        mnemonicBtnGroups.setDataSource(contetnArr: mnemonic, titleArr: title)
        self.view.addSubview(mnemonicBtnGroups)
        mnemonicBtnGroups.confirmReturnValueClosure = {
            (selArr,groupIdArr) in
        }
        mnemonicBtnGroups.currentSelValueClosure = {
            (valueStr,index,groupId) in
        }
    }

}

extension YBMnemonicController : YBGroupAndStreamViewDelegate{
    
    func currentSelValueWithDelegate(valueStr: String, index: Int, groupId: Int) {
        print("\(valueStr) index = \(index), groupid = \(groupId)")
    }
    
    func confimrReturnAllSelValueWithDelegate(selArr: Array<Any>, groupArr: Array<Any>) {
        print(selArr)
    }
}
