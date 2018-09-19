//
//  UIBarButtonItem-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/5.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero)  {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView : btn)
    }
}
