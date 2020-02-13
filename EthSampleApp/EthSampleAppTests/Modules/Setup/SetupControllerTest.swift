//
//  SetupControllerTest.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class SetupControllerTest: XCTestCase {
    var sut : SetupViewController!
    
    override func setUp() {
        sut  = SetupBuilder.build()
        _ = sut.view // to call viewDidLoad()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testControllerHasTextField() {
        XCTAssertNotNil(sut.txtPrivateKey,
                        textFieldNilError)
    }
    
    func testTextFieldDelegateSetUpCorrectly() {
        XCTAssertTrue(sut.txtPrivateKey.delegate is SetupViewController , textFieldDelegateError)
    }
    
}
