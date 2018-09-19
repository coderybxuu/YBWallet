//
//  YBMainViewController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/5.
//  Copyright © 2018年 tjsk. All rights reserved.
//

import UIKit

class YBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //通过加载json文件创建控制器（为以后加载服务器数据做铺垫）
        guard let jsonPath = Bundle.main.path(forResource: kMainVcInfon, ofType: nil) else{return}
        guard let jsonData = NSData(contentsOfFile: jsonPath) else{return}
        guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else{return}
        guard let dicArray = anyObject as? [[String:AnyObject]] else{return}
        for dic in dicArray {
            guard let vcName = dic["vcName"] as? String else{continue}
            guard let title = dic["title"] as? String else{continue}
            guard let imageName = dic["imageName"] as? String else{continue}
            addChildControllers(childName: vcName, title: title, imageName: imageName)
            
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}

//添加自控制器
extension YBMainViewController{
    
    fileprivate func addChildControllers(childName:String,title:String,imageName:String){

        guard let childVcClass = NSClassFromString(Bundle.main.namespace + "." + childName) else{return}
        guard let childType = childVcClass as? UIViewController.Type else {return}
        let childVC = childType.init()
        childVC.title = title
        childVC.tabBarItem.image = UIImage.yb_originalImage(imageName)
        childVC.tabBarItem.selectedImage = UIImage.yb_originalImage(imageName + "_selected")
        //设置字体颜色
        childVC.tabBarItem.setTitleTextAttributes([.foregroundColor : kTableBarTextColor], for: .selected)
        //字体大小  默认12
        childVC.tabBarItem.setTitleTextAttributes([.font:UIFont.systemFont(ofSize: 12)], for: .normal)
        let childNav = YBCustomNavigationController(rootViewController: childVC)
        addChildViewController(childNav)
    }
}
