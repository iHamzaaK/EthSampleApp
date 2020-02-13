//
//  SetupControllerMock.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class SetupControllerMock: SetupViewController {

    override func viewDidLoad() {
        self.txtPrivateKey.text = self.viewModel.getPkKey()
        self.title = self.viewModel.getTitle()
    }
   

}
