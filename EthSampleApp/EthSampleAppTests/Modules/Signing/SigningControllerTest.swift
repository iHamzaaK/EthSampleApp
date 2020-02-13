//
//  SigningControllerTest.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class SigningControllerTest: XCTestCase {

    var sut : SigningViewController!

    override func setUp() {
        sut = SigningBuilder.build(wallet: sampleWallet)
               XCTAssertNotNil(sut)
               _ = sut.view // to call viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testControllerHasTextField() {
        XCTAssertNotNil(sut.txtMsg,
                        textFieldNilError)
    }
    
    func testTextFieldDelegateSetUpCorrectly() {
        XCTAssertTrue(sut.txtMsg.delegate is SigningViewController , textFieldDelegateError)
    }
    
    
}
