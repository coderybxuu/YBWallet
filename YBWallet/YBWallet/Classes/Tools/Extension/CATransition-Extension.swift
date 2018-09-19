//
//  CATransition-Extension.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/19.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

extension CATransition{
    
    //切换跟控制器防止生硬过度动画
    class func yb_getTransition() ->CATransition{
        
        let transtition = CATransition()
        transtition.duration = 0.5
        transtition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        return transtition
    }
    
}
