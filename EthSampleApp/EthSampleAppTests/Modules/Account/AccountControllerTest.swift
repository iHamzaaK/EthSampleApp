//
//  AccountControllerTest.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class AccountControllerTest: XCTestCase {
    
    var sut : AccountViewController!
    
    override func setUp() {
        sut = AccountBuilder.build(wallet: sampleWallet)
        XCTAssertNotNil(sut)
        _ = sut.view // to call viewDidLoad()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testControllerHasLabels() {
        XCTAssertNotNil(sut.lblAddress, AccountAddressLabelNilError)
        XCTAssertNotNil(sut.lblBalance, AccountBalanceLabelNilError)
    }
    
}
