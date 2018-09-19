
//  Created by xuyangbo on 2018/9/5.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation

extension Date {
    //获取当前时间
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}


