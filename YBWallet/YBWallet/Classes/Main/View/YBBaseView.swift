//
//  YBBaseView.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/20.
//  Copyright © 2018年 coderybxu. All rights reserved.
//

import UIKit

class YBBaseView: UIView {

    ///背景
    lazy var  bgImgView : UIImageView = {
        let bgImgView = UIImageView()
        bgImgView.image = UIImage.yb_blurry(UIImage(named: "bg")!, level: 0.7)
        bgImgView.isUserInteractionEnabled = true
        return bgImgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI()  {
        addSubview(bgImgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImgView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}
