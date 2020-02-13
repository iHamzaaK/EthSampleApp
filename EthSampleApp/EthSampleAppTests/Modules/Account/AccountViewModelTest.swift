//
//  AccountViewModelTest.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class AccountViewModelTest: XCTestCase {
    var  viewModel: AccountViewModel!
    var  view: AccountControllerMock!
    
    override func setUp() {
        setupDependencies()
    }
    func setupDependencies(){
        view = AccountControllerMock()
        let repo = BalanceRepoImplementation()
        viewModel = AccountViewModel(Controllers.account.getNavigationBarTitle(), wallet: sampleWallet, repo: repo)
        view.viewModel = viewModel
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        viewModel = nil
    }
    
    func testAccountBalanceService(){
        self.viewModel.getBalance { (balance) in
            XCTAssertEqual(balance, sampleBalance)
        }
    }
    func testSignButtonAction(){
        self.viewModel.didTapOnSign { (vc) in
            XCTAssertNotNil(vc)
            
        }
    }
    func testVerifyButtonAction(){
        self.viewModel.didTapOnVerify { (vc) in
            XCTAssertNotNil(vc)
        }
    }
    
}
