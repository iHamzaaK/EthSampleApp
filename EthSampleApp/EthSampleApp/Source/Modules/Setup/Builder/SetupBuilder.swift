//
//  SetupBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

protocol SetupBusinessLogic
{
  func doSomething(request: Setup.Something.Request)
}



class SetupBuilder: SetupBusinessLogic
{
    func build()-> UIViewController{
        
    }
}
