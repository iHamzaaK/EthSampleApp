//
//  SigningViewModelTest.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class SigningViewModelTest : XCTestCase {
    var  viewModel: SigningViewModel!
    var  view: SigningControllerMock!
    

    override func setUp() {
        setupDependencies()
    }
    func setupDependencies(){
        view = SigningControllerMock()
        viewModel = SigningViewModel(Controllers.signing.getNavigationBarTitle(), sampleWallet)
        view.viewModel = viewModel
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        viewModel = nil
    }
    func testSignTransactionQRImage(){
        self.viewModel.didTapOnSign(sampleMessage) { (img) in            
            XCTAssertNotNil(img)
        }
    }

}
