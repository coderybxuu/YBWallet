//
//  Created by xuyangbo on 2018/9/5.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//
import UIKit

class YBCustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = kMainColor
        navigationBar.tintColor = kNavTextColor
        navigationBar.titleTextAttributes = [.foregroundColor : kNavTextColor]
        
        // 获取系统的Pop手势
        guard let systemGes = interactivePopGestureRecognizer else { return }
        
        // 获取手势添加到的View中
        guard let gesView = systemGes.view else { return }
        
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
    
        guard let target = targetObjc.value(forKey: "target") else { return }
        
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 如果不是栈底控制器才需要隐藏，根控制器不需要处理
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
