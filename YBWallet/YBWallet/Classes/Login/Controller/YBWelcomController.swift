//
//  YBWelcomController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/20.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

class YBWelcomController: YBBaseViewController {
    ///属性
    fileprivate lazy var welcomView : YBWelcomView = {
        let welcomView = YBWelcomView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        welcomView.delegate = self
        return welcomView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(welcomView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension YBWelcomController : YBWelcomViewable{
    func createNewWalle() {
        navigationController?.pushViewController(YBCreatWalletController(), animated: true)
    }
    
    func importNewWallet() {
        
        window?.makeToast("此功能正在开发中")
    }
}
