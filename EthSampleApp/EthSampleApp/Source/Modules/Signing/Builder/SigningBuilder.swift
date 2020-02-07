//
//  SigningBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

protocol SigningBusinessLogic
{
  func doSomething(request: Signing.Something.Request)
}



class SigningBuilder: SigningBusinessLogic
{
    func build()-> UIViewController{
        
    }
}
