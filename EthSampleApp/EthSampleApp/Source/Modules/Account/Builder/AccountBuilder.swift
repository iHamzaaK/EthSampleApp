//
//  AccountBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

protocol AccountBusinessLogic
{
  func doSomething(request: Account.Something.Request)
}



class AccountBuilder: AccountBusinessLogic
{
    func build()-> UIViewController{
        
    }
}
