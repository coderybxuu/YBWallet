//
//  YBCreatWalletController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/20.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

class YBCreatWalletController: YBBaseViewController {

    fileprivate lazy var creatWalletView : YBCreatWalletView = {
        let creatWalletView = YBCreatWalletView(frame: CGRect(origin: .zero, size: CGSize(width: kScreenW, height: kScreenH)))
        creatWalletView.delegate = self
        return creatWalletView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(creatWalletView)
    }

}

extension YBCreatWalletController:YBCreatWalletViewable,YBCreatWalletable{
    func createNewWalle() {
         guard let walletName = self.creatWalletView.walletNameTextField.textField.text,
               let pwd = self.creatWalletView.pwdTextField.textField.text,
               let rePwd = self.creatWalletView.pwdRepeatTextField.textField.text,
            !(pwd.isEmpty || rePwd.isEmpty || walletName.isEmpty) else{
              window?.makeToast("输入有误")
              return
        }
        if pwd != rePwd {
            window?.makeToast("两次密码输入不一致")
            return
        }
        
        //判断钱包是否存在（）
        let walletModel = YBSQWalletListModel.init()
        walletModel.walletName = walletName

        let results = SQLiteDataBase.shared.select_wrapper_model(walletModel, fromTable: kWalletListsSqlTableName)
        print(results)
        
        if results.count > 0 {
            window?.makeToast("此钱包已经存在"); return
        }else{
            //创建钱包
            creatWallet(pwd, name: walletName)
            let appearance = YBAlertView.YBAppearance(
                showCloseButton: false //不显示关闭按钮
            )
            let alert = YBAlertView(appearance: appearance)
            alert.addButton("备份钱包") {
                let vc = YBBackupController()
                vc.walletName = walletName
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alert.showSuccess("新钱包创建完成",subTitle: "请备份钱包，防止钱包丢失对您造成损失")
        }
        
        
        
        
//        if let results = SQLiteDataBase.shared.select(fromTable: kWalletListsSqlTableName)
//        {
//            print(model.walletAddress)
//                window?.makeToast("此钱包已经存在"); return
//
//        }else{
//            //创建钱包
//            creatWallet(pwd, name: walletName)
//            let appearance = YBAlertView.YBAppearance(
//                showCloseButton: false //不显示关闭按钮
//            )
//            let alert = YBAlertView(appearance: appearance)
//            alert.addButton("备份钱包") {
//                let vc = YBBackupController()
//                vc.walletName = walletName
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            alert.showSuccess("新钱包创建完成",subTitle: "请备份钱包，防止钱包丢失对您造成损失")
//        }
    }
}
