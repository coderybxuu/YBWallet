//
//  YBBackupController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/21.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit
import SnapKit

class YBBackupController: YBBaseViewController {

    ///备份钱包
    fileprivate lazy var backupWalletBtn : UIButton = {
        let backupWalletBtn = UIButton(title: "备份钱包")
        backupWalletBtn.addTarget(self, action: #selector(backupWallet), for: .touchUpInside)
        return backupWalletBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backupWalletBtn)
        backupWalletBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenW - 100, height: 30))
            make.center.equalTo(self.view)
        }
    }
}

extension YBBackupController{
    @objc func backupWallet() {
        
    }
}
