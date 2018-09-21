//
//  UIButton-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/20.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title:String) {
        
        self.init()
        backgroundColor = kMainColor
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 12)
        layer.cornerRadius = 3
        layer.masksToBounds = true
    }
}

