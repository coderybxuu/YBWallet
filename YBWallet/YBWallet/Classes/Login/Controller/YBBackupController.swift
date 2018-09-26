//
//  YBBackupController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/21.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

class YBBackupController: YBBaseViewController {

    ///钱包名称
    var walletName : String?
    fileprivate lazy var titleLable : UILabel = {
        let lable = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: current_h(height: 80)), size: CGSize(width: kScreenW, height: 15)))
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 15)
        lable.text = "抄写您的助记词，存放到安全的地方"
        return lable
    }()
    
    fileprivate lazy var wordsLable : UILabel = {
        let lable = UILabel()
        lable.backgroundColor = UIColor.lightGray
        lable.font = UIFont.systemFont(ofSize: 11)
        lable.numberOfLines = 0
        guard let walletModel = YBWalletSQManager.shared.search(walletName!) else{ return lable}
        let text = walletModel.walletMnemonic
        lable.text = text
        let width = kScreenW-30
        let height = text.obtainTextHeight(fixedWidth: width)
        lable.frame = CGRect(x: 15, y: titleLable.frame.origin.y + 30, width: width, height: height)
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "备份助记词"
        view.addSubview(titleLable)
        view.addSubview(wordsLable)
    }
}

extension YBBackupController{
   
}
