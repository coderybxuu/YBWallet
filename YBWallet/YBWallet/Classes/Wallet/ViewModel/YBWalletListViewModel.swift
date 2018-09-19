//
//  TJWalletViewModel.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/12.
//  Copyright © 2018年 tjsk. All rights reserved.
//

import Foundation

class YBWalletListViewModel {

     lazy var statusList : [YBWallletViewModel] = [YBWallletViewModel]()
}

extension YBWalletListViewModel{
    
    func getTypesDigitalCurrencies(){
        
        YBReachability.shared().isReachable ? loadData() : window?.makeToast("网络不可用")
    }
    
    func loadData() {
        //实际需要加载数据
        guard let jsonPath = Bundle.main.path(forResource: kCurrenciesType, ofType: nil) else{return}
        guard let jsonData = NSData(contentsOfFile: jsonPath) else{return}
        
        guard let json = try? JSON(data: jsonData as Data) else{return}
        
        var array = [YBWallletViewModel]()
        for data in json.array ?? [] {
            guard let dic = data.dictionaryObject else{return}
            let walletModel = YBWalletModel(dict: dic)
            array.append(YBWallletViewModel(model: walletModel))
        }
        
        statusList = array
    }
}
