//
//  YBLoginView.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/14.
//  Copyright © 2018年 tjsk. All rights reserved.
//

import UIKit

protocol YBloginViewAble {
    func login()
    func forget()
    func registered()
}

class YBLoginView: YBBaseView {
    
    ///代理
    var delegate: YBloginViewAble?
    
    ///logo
    fileprivate lazy var logoView : UIImageView = {
        
        let logoView = UIImageView()
        logoView.layer.masksToBounds = true
        logoView.layer.cornerRadius = current_w(width: 4)
        //性能遗留
        logoView.image = UIImage(named: "logo")
        return logoView
    }()
    
    ///账号输入框
     lazy var accountTextField : YBTextField = {
        
        let accountTextField = YBTextField()
        accountTextField.placeholder = "请输入手机号"
        accountTextField.maxLength = 11
        accountTextField.errorStr = "超出字数限制"
        accountTextField.leftIconName = "icon_usr_account"
        accountTextField.textField.keyboardType = .numberPad
        return accountTextField
    }()
    
    ///密码输入框
     lazy var pwdTextField : YBTextField = {
        
        let pwdTextField = YBTextField()
        pwdTextField.placeholder = "请输入密码"
        pwdTextField.errorStr = "超出字数限制"
        pwdTextField.leftIconName = "icon_usr_pwd"
        pwdTextField.maxLength = 16
        pwdTextField.textField.keyboardType = .asciiCapable
        pwdTextField.textField.isSecureTextEntry = true
        return pwdTextField
    }()
    
    ///登录按钮
    fileprivate lazy var loginBtn : UIButton = {
        let loginBtn = UIButton()
        loginBtn.backgroundColor = UIColor(r: 83, g: 178, b: 233)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        loginBtn.layer.cornerRadius = 3
        loginBtn.layer.masksToBounds = true
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        return loginBtn
    }()
    
    ///忘记密码
    fileprivate lazy var forgetPwdBtn : UIButton = {
        let forgetPwdBtn = UIButton()
        forgetPwdBtn.backgroundColor = UIColor.clear
        forgetPwdBtn.contentHorizontalAlignment = .left
        forgetPwdBtn.setTitle("忘记密码？", for: .normal)
        forgetPwdBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        forgetPwdBtn.addTarget(self, action: #selector(forget), for: .touchUpInside)
        return forgetPwdBtn
    }()
    
    ///注册
    fileprivate lazy var registeredBtn : UIButton = {
        let registeredBtn = UIButton()
        registeredBtn.backgroundColor = UIColor.clear
        registeredBtn.setTitle("注册", for: .normal)
        registeredBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        registeredBtn.contentHorizontalAlignment = .right
        registeredBtn.addTarget(self, action: #selector(registered), for: .touchUpInside)
        return registeredBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        bgImgView.addSubview(logoView)
        bgImgView.addSubview(accountTextField)
        bgImgView.addSubview(pwdTextField)
        bgImgView.addSubview(loginBtn)
        bgImgView.addSubview(forgetPwdBtn)
        bgImgView.addSubview(registeredBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        logoView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: current_w(width: 60), height: current_w(width: 60)))
            make.centerX.equalTo(self)
            make.top.equalTo(kScreenH * 0.15)
        }
        
        accountTextField.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenW - 100, height: 30))
            make.centerX.equalTo(self)
            make.top.equalTo(logoView.snp.bottom).offset(current_h(height: 80))
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenW - 100, height: 30))
            make.centerX.equalTo(self)
            make.top.equalTo(accountTextField.snp.bottom).offset(30)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenW - 100, height: 30))
            make.centerX.equalTo(self)
            make.top.equalTo(pwdTextField.snp.bottom).offset(30)
        }
        
        forgetPwdBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 15))
            make.left.equalTo(loginBtn.snp.left)
            make.top.equalTo(loginBtn.snp.bottom).offset(10)
        }
        
        registeredBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width:100, height: 15))
            make.right.equalTo(loginBtn.snp.right)
            make.top.equalTo(loginBtn.snp.bottom).offset(10)
        }
    }
}

//点击事件
extension YBLoginView{

    @objc func login(){
        if delegate != nil  && responds(to: #selector(login)){
            delegate?.login()
        }
    }

    @objc func forget(){
        if delegate != nil  && responds(to: #selector(forget)){
            delegate?.forget()
        }
    }

    @objc func registered(){

        if delegate != nil  && responds(to: #selector(registered)){
            delegate?.registered()
        }
    }
}
