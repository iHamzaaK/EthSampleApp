//
//  AccountControllerMock.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class AccountControllerMock: AccountViewController {

   override func viewDidLoad() {
       self.title = self.viewModel.getTitle()
       self.viewModel.getBalance { [unowned self] (balance) in
           DispatchQueue.main.async {
               self.lblBalance.text = balance
           }
       }
       self.lblAddress.text = self.viewModel.getAddress()

   }

}
