//
//  YBWelcomView.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/20.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

protocol YBWelcomViewable {
    func createNewWalle()
    func importNewWallet()
}

class YBWelcomView: YBBaseView {

    ///属性
    ///代理
    var delegate: YBWelcomViewable?
    ///创建新钱包
    fileprivate lazy var createNewWalletBtn : UIButton = {
        let createNewWalletBtn = UIButton()
        createNewWalletBtn.backgroundColor = UIColor(r: 83, g: 178, b: 233)
        createNewWalletBtn.setTitle("创建新钱包", for: .normal)
        createNewWalletBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        createNewWalletBtn.layer.cornerRadius = 3
        createNewWalletBtn.layer.masksToBounds = true
        createNewWalletBtn.addTarget(self, action: #selector(createNewWalle), for: .touchUpInside)
        return createNewWalletBtn
    }()
    
    ///导入新钱包
    fileprivate lazy var importNewWalletBtn : UIButton = {
        let importNewWalletBtn = UIButton()
        importNewWalletBtn.backgroundColor = UIColor(r: 83, g: 178, b: 233)
        importNewWalletBtn.setTitle("导入新钱包", for: .normal)
        importNewWalletBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        importNewWalletBtn.layer.cornerRadius = 3
        importNewWalletBtn.layer.masksToBounds = true
        importNewWalletBtn.addTarget(self, action: #selector(importNewWallet), for: .touchUpInside)
        return importNewWalletBtn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI()  {
        super.setupUI()
        bgImgView.addSubview(createNewWalletBtn)
        bgImgView.addSubview(importNewWalletBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createNewWalletBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenW - 100, height: 30))
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-80)
        }
        
        importNewWalletBtn.snp.makeConstraints { (make) in
            make.size.equalTo(createNewWalletBtn.snp.size)
            make.centerX.equalTo(self)
            make.centerY.equalTo(createNewWalletBtn).offset(80)
        }
    }
}

//点击事件
extension YBWelcomView{
    @objc func createNewWalle() {
        if delegate != nil  && responds(to: #selector(createNewWalle)){
            delegate?.createNewWalle()
        }
    }
    
    @objc func importNewWallet() {
        if delegate != nil  && responds(to: #selector(importNewWallet)){
            delegate?.importNewWallet()
        }
    }
}
