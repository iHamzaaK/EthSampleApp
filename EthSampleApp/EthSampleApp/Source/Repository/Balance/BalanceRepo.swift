//
//  BalanceRepo.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 13/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation

protocol BalanceRepo  {
    func getAccountBalance(address : String, completionHandler: @escaping(_ success: Bool, _ message: String , _ balance : String)->Void)
}
