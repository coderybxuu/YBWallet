//
//  YBBaseTableViewCell.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/12.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

class YBBaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.accessoryType =  .none
        self.contentView.backgroundColor = UIColor.white
        
        initWithView()
        
    }
    
    /// 配置子控件
    public func initWithView(){
        
    }
    
    public class func identifier() -> String {
        
        let name: AnyClass! = object_getClass(self)
        return NSStringFromClass(name)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
