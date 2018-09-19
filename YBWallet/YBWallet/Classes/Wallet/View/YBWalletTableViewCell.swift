//
//  YBWalletTableViewCell.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/12.
//  Copyright © 2018年 tjsk. All rights reserved.
//

import UIKit
import SnapKit

class YBWalletTableViewCell: YBBaseTableViewCell {
   
    fileprivate lazy var iconView : UIImageView = UIImageView()
    fileprivate lazy var typeLable : UILabel = UILabel()
    var viewModel : YBWallletViewModel? {
        didSet{
            iconView.image = UIImage(named: (viewModel?.walletModel.iconView ?? ""))
            typeLable.text = viewModel?.walletModel.typeTitle
        }
    }
    
    override func initWithView() {
        contentView.addSubview(iconView)
        contentView.addSubview(typeLable)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let spaceLable : CGFloat = 20
        let spaceIconView : CGFloat = 13
        iconView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(spaceIconView)
            make.bottom.equalToSuperview().offset(-spaceIconView)
            make.left.equalToSuperview().offset(spaceLable)
            make.width.equalTo(contentView.frame.size.height - spaceIconView*2)
            
        }
        
        typeLable.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(spaceLable)
            make.bottom.equalToSuperview().offset(-(spaceLable))
            make.right.equalToSuperview()
            make.left.equalTo(iconView.snp.right).offset(spaceLable)
        }
    }
}
