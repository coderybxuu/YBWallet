//
//  YBBaseViewController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/6.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

class YBBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        loadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    
    func loadData(){
        
    }
}
