//
//  YBNetwork.swift
//  YBWallet
//
//  Created by xuyangbo on 2018/9/10.
//  Copyright © 2018年 xuyangbo. All rights reserved.
//

import Foundation
import Moya

//let provider = MoyaProvider<TWalletApi>()

enum YBWalletApi : YBBaseApiable {
    //用户信息
    case userInfo
    //以太坊
    case signup_Eth(String)
    case signin_Eth
    case submitwallet_Eth([String])
    case wallets_Eth
    case balance_Eth(String)
    case skel_Eth([String])
    case tx_Eth(String)
    case send_Eth([String])
    //比特币
    case btBalance_Btc(String)
    case btUnspend_Btc(String,[String])
    case btSend_Btc(String,[String])
}

extension YBWalletApi : TargetType{
    
    
    var baseURL: URL {
        return yb_BaseURL
    }

    var path: String {
        switch self {
        case .userInfo:
            return user
            
        case .signup_Eth:
            return signup
        case .signin_Eth:
            return signin
        case .submitwallet_Eth:
            return submitwallet
        case .wallets_Eth:
            return wallets
        case .balance_Eth(let parth):
            return balance + parth
        case .skel_Eth:
            return skel
        case .tx_Eth:
            return tx
        case .send_Eth:
            return send
            
            
        case .btBalance_Btc(let parth):
            return btBalance + parth
        case .btUnspend_Btc(let parth,_):
            return btBalance + parth
        case .btSend_Btc(let parth,_):
            return btSend + parth
            
        }
        
        
    }
    
    var method: Moya.Method {
        switch self {
        case .userInfo,.wallets_Eth,.balance_Eth,.btBalance_Btc:
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        
        var params: [String: Any] = [:]
        
        switch self {
        case .userInfo:
            return .requestPlain
        case .signup_Eth(let payment_address):
            
            params["payment_address"] = payment_address
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        case .signin_Eth:
            return .requestPlain
            
        case .submitwallet_Eth(let parametersarray):
            params["payment_address"] = parametersarray[0]
            params["coin_type"] = parametersarray[1]
            params["is_self"] = parametersarray[2]
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        case .wallets_Eth:
            return .requestPlain
        case .balance_Eth:
            return .requestPlain
        case .skel_Eth(let parametersarray):
            params["from_address"] = parametersarray[0]
            params["to_address"] = parametersarray[1]
            params["gas_price"] = parametersarray[2]
            params["gas"] = parametersarray[3]
            params["data"] = parametersarray[4]
            params["value"] = parametersarray[5]
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        case .tx_Eth(let tx):
            params["tx"] = tx
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        case .send_Eth(let parametersarray):
            params["from_address"] = parametersarray[0]
            params["signtrue"] = parametersarray[1]
            params["tx_hash"] = parametersarray[2]
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        case .btBalance_Btc:
            return .requestPlain
            
        case .btUnspend_Btc(_, let parametersarray):
            params["send_satoshis"] = parametersarray[0]
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
            
        case .btSend_Btc(_, let parametersarray):
            params["raw_transaction"] = parametersarray[0]
            return .requestParameters(parameters: params,
                                      encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var params: [String: Any] = [:]
        switch self {
        case .userInfo:
            let headers = getHeaders(method: "GET", parth: user, isHaveparameter: false)
            return headers
        case .signup_Eth(let payment_address):
            params["payment_address"] = payment_address
            let headers = getHeaders(method: "POST", parth: signup, isHaveparameter: true,parameters: params)
            return headers
        case .signin_Eth:
            let headers = getHeaders(method: "POST", parth: signin, isHaveparameter: false)
            return headers
        //
        case .submitwallet_Eth(let parametersarray):
            params["payment_address"] = parametersarray[0]
            params["coin_type"] = parametersarray[1]
            params["is_self"] = parametersarray[2]
            let headers = getHeaders(method: "POST", parth: submitwallet, isHaveparameter: true,parameters: params)
            return headers
        case .wallets_Eth:
            let headers = getHeaders(method: "GET", parth: wallets, isHaveparameter: false)
            return headers
        case .balance_Eth(let parth):
            let headers = getHeaders(method: "GET", parth: balance + parth, isHaveparameter: false)
            return headers
        case .skel_Eth(let parametersarray):
            params["from_address"] = parametersarray[0]
            params["to_address"] = parametersarray[1]
            params["gas_price"] = parametersarray[2]
            params["gas"] = parametersarray[3]
            params["data"] = parametersarray[4]
            params["value"] = parametersarray[5]
            let headers = getHeaders(method: "POST", parth: skel, isHaveparameter: true,parameters: params)
            return headers
        case .tx_Eth(let tx):
            params["tx"] = tx
            let headers = getHeaders(method: "POST", parth: tx, isHaveparameter: true,parameters: params)
            return headers
            
        case .send_Eth(let parametersarray):
            params["from_address"] = parametersarray[0]
            params["signtrue"] = parametersarray[1]
            params["tx_hash"] = parametersarray[2]
            let headers = getHeaders(method: "POST", parth: send, isHaveparameter: true,parameters: params)
            return headers
            
        case .btBalance_Btc(let parth):
            let headers = getHeaders(method: "GET", parth: btBalance + parth, isHaveparameter: false)
            print(parth)
            return headers
        case .btUnspend_Btc(let parth, let parametersarray):
            params["send_satoshis"] = parametersarray[0]
            let headers = getHeaders(method: "POST", parth: btUnspend + parth, isHaveparameter: true, parameters: params)
            return headers
            
        case .btSend_Btc(let parth, let parametersarray):
            params["raw_transaction"] = parametersarray[0]
            let headers = getHeaders(method: "POST", parth: btSend + parth, isHaveparameter: true, parameters: params)
            return headers
        }
    }
    
    public var validate: Bool {
        return false
    }
}

