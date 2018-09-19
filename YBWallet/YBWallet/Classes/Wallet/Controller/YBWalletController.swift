//
//  YBWalletController.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/5.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import UIKit

class YBWalletController: YBBaseViewController , YBTableViewable{

    ///属性
    fileprivate lazy var walletTableView : UITableView  = creatUITableView(size: view.frame.size)
    ///视图模型
    fileprivate lazy var walletListViewModel = YBWalletListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //获取数据
    override func loadData() {
        walletListViewModel.getTypesDigitalCurrencies()
    }
}

//UI
extension YBWalletController{
    func setupUI() {
        setNavigatition(rightImageName: "btn_live")
        view.addSubview(walletTableView)
    }
}

//navigetion点击事件
extension YBWalletController:YBCustomNavigatioBarable{
    func rightItemClick() {
        let scanVC = MMScanViewController.init(qrType: .init(0)) { (address, error) in
            
        }
        navigationController?.pushViewController(scanVC!, animated: true)
    }
}

//MARK:-  =============UITableViewDelegate,UITableViewDataSource===============
extension YBWalletController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walletListViewModel.statusList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = walletTableView.dequeueReusableCell(withIdentifier: YBWalletTableViewCell.identifier(), for: indexPath) as! YBWalletTableViewCell
        let viewModel = walletListViewModel.statusList[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }
}

