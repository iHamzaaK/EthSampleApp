//
//  SetupViewModelTest.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import XCTest
@testable import EthSampleApp

class SetupViewModelTest: XCTestCase {
    var  viewModel: SetupViewModel!
    var  view: SetupControllerMock!
    
    override func setUp() {
        setupDependencies()
    }
    func setupDependencies(){
        view = SetupControllerMock()
        viewModel = SetupViewModel(Controllers.setup.getNavigationBarTitle())
        view.viewModel = viewModel
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        viewModel = nil
    }
    
    func testAccountCreation(){
        self.viewModel.testAccount()
        let strPk = self.viewModel.getPkKey()
        XCTAssertEqual(strPk, samplePrivateKey)
    }
    
    func testPrivateKeyExist(){
        self.viewModel.testAccount()
        let strPk = self.viewModel.getPkKey()
        self.viewModel.checkPrivateKey(privateKey: strPk) { (success, wallet) in
            if success{
                XCTAssertNotNil(wallet)
            }
            else{
                XCTFail()
            }
        }
    }
    
}
