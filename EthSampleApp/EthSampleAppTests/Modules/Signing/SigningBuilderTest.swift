//
//  SigningBuilderTest.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import XCTest
@testable import EthSampleApp

class SigningBuilderTest: XCTestCase {
    var sut: SigningViewController?
    
    override func setUp() {
        sut = SigningBuilder.build(wallet: sampleWallet)
        XCTAssertNotNil(sut)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSigningController() {
        let vc = sut
        XCTAssertNotNil(vc)
        XCTAssertNotNil(vc?.viewModel)
        
    }
    
    func testSigningControllerTitle(){
        let vc = sut
        XCTAssertEqual(Controllers.signing.getNavigationBarTitle(), vc?.viewModel.getTitle())
    }
    func testSigningAccountWallet(){
        let vc = sut
        XCTAssertNotNil(vc?.viewModel.wallet)
        XCTAssertEqual(sampleAccountAddress, vc?.viewModel.wallet.getAddress())
    }
    
}
