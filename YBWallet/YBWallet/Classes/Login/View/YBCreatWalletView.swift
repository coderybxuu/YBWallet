//
//  YBCreatWalletView.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/20.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

protocol YBCreatWalletViewable {
    func createNewWalle()
}
class YBCreatWalletView: YBBaseView {

    ///代理
    var delegate: YBCreatWalletViewable?
    ///钱包名称
    lazy var walletNameTextField : YBTextField = {
        let walletNameTextField = YBTextField()
//        walletNameTextField.leftIconName = "icon_usr_account"
        walletNameTextField.isSetLeftIcon = false
        walletNameTextField.isSetMaxSetLength = false
        walletNameTextField.placeholder = "钱包名称"
        return walletNameTextField
    }()
    
    ///密码输入框
    lazy var pwdTextField : YBTextField = {
        
        let pwdTextField = YBTextField()
        pwdTextField.isSetLeftIcon = false
        pwdTextField.isSetMaxSetLength = false
        pwdTextField.placeholder = "请输入密码"
//        pwdTextField.leftIconName = "icon_usr_pwd"
        pwdTextField.textField.isSecureTextEntry = true

        return pwdTextField
    }()

    ///重复密码
    lazy var pwdRepeatTextField : YBTextField = {
        
        let pwdRepeatTextField = YBTextField()
        pwdRepeatTextField.placeholder = "重复密码"
        pwdRepeatTextField.isSetLeftIcon = false
        pwdRepeatTextField.isSetMaxSetLength = false
//        pwdRepeatTextField.leftIconName = "icon_usr_pwd"
        pwdRepeatTextField.textField.isSecureTextEntry = true
        return pwdRepeatTextField
    }()
    
    ///创建新钱包
    fileprivate lazy var creatNewWalletBtn : UIButton = {
        let creatNewWalletBtn = UIButton(title: "创建新钱包")
        creatNewWalletBtn.addTarget(self, action: #selector(creatNewWallet), for: .touchUpInside)
        return creatNewWalletBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgImgView.addSubview(walletNameTextField)
        bgImgView.addSubview(pwdTextField)
        bgImgView.addSubview(pwdRepeatTextField)
        bgImgView.addSubview(creatNewWalletBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        walletNameTextField.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenW - 100, height: 30))
            make.centerX.equalTo(self)
            make.top.equalTo(self.snp.top).offset(current_h(height: 80))
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.size.equalTo(walletNameTextField.snp.size)
            make.centerX.equalTo(self)
            make.top.equalTo(walletNameTextField.snp.top).offset(current_h(height: 80))
        }
        
        pwdRepeatTextField.snp.makeConstraints { (make) in
            make.size.equalTo(walletNameTextField.snp.size)
            make.centerX.equalTo(self)
            make.top.equalTo(pwdTextField.snp.top).offset(current_h(height: 80))
        }
        
        creatNewWalletBtn.snp.makeConstraints { (make) in
            make.size.equalTo(walletNameTextField.snp.size)
            make.centerX.equalTo(self)
            make.top.equalTo(pwdRepeatTextField.snp.top).offset(current_h(height: 130))
        }
        
    }
}


extension YBCreatWalletView{
    @objc func creatNewWallet(){
        if delegate != nil  && responds(to: #selector(creatNewWallet)){
            delegate?.createNewWalle()
        }
    }
}
