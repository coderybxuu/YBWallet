//
//  YBTableViewable.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/12.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

protocol YBTableViewable {}

extension YBTableViewable where Self : UIViewController{
    
    func creatUITableView(size:CGSize,rowHeight:CGFloat = 64) -> UITableView {
        let tableView = UITableView(frame: CGRect(origin: CGPoint.zero, size: size), style: .plain)
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as? UITableViewDataSource
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = rowHeight
        tableView.showsVerticalScrollIndicator = false
        tableView.register(YBWalletTableViewCell.self, forCellReuseIdentifier: YBWalletTableViewCell.identifier())
        tableView.tableFooterView = UIView() //没数据不显示cell分割线
        tableView.separatorInset = .zero
        return tableView
    }
}

