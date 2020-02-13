//
//  SetupBuilderTest.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class SetupBuilderTest: XCTestCase {
    var sut: SetupViewController?
    
    override func setUp() {
        sut = SetupBuilder.build()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSetupController() {
        let vc = sut
        XCTAssertNotNil(vc)
        XCTAssertNotNil(vc?.viewModel)
        XCTAssertEqual(Controllers.setup.getNavigationBarTitle(), vc?.viewModel.getTitle())
    }
    
}
