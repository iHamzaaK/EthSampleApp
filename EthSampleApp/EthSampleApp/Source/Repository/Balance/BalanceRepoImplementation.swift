//
//  BalanceRepoImplementation.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 13/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation
import Web3swift
class BalanceRepoImplementation : BalanceRepo{
    
    let url = Utility.getCustomURL()
    func getAccountBalance(address: String, completionHandler: @escaping (Bool, String, String) -> Void) {
        let headers = [
            "Content-Type": "application/json",
        ]
        let parameters = [
            "jsonrpc": "2.0",
            "method": "eth_getBalance",
            "params": [address.lowercased(), "latest"],
            "id": 1
            ] as [String : Any]
        
        BaseRepository.instance.request(headers: headers, params: parameters, requestType: .post, url: url) { (success, message, data) in
            guard let data = data else {
                completionHandler(false, message, AlertMessage.notAvailable)
                return
            }
            do{
                let decodedResults = try JSONDecoder().decode(Balance.self, from: data)
                if let result = decodedResults.result , decodedResults.result != ""{
                    let weiBalance = UInt64(strtoul(result, nil, 16))
                    let ethBalance = Utility.getEthBalance(weiBalance: weiBalance)
                    completionHandler(true,"",ethBalance)
                }
                else{
                    completionHandler(false, message, AlertMessage.notAvailable)
                }
            }
            catch{
                completionHandler(false, message, AlertMessage.notAvailable)
                
            }
        }
    }
    
}
