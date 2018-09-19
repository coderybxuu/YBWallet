//
//  YBCustomNavigatioBarable.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/7.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

@objc protocol YBCustomNavigatioBarable {
    @objc optional func leftItemClick()
    @objc optional func rightItemClick()
}

extension YBCustomNavigatioBarable where Self:UIViewController{
    func setNavigatition(leftImageName:String = "",rightImageName:String = ""){
        (leftImageName != "") ? self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: leftImageName), style:.done ,target: self, action: #selector(leftItemClick)) : ()
        // 右边的按钮
        (rightImageName != "") ? self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: rightImageName), style:.done, target: self, action: #selector(rightItemClick)) : ()
    }
}
