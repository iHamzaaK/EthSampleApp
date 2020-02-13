//
//  AccountBuilerTest.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class AccountBuilerTest: XCTestCase {
    var sut: AccountViewController?
    
    override func setUp() {
        sut = AccountBuilder.build(wallet: sampleWallet)
        XCTAssertNotNil(sut)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAccountController() {
        let vc = sut
        XCTAssertNotNil(vc)
        XCTAssertNotNil(vc?.viewModel)
        
    }
    func testAccountControllerTitle(){
        let vc = sut
        XCTAssertEqual(Controllers.account.getNavigationBarTitle(), vc?.viewModel.getTitle())
    }
    func testAccountWallet(){
        let vc = sut
        XCTAssertNotNil(vc?.viewModel.getAddress())
        XCTAssertEqual(sampleAccountAddress, vc?.viewModel.getAddress())

    }
    
}
