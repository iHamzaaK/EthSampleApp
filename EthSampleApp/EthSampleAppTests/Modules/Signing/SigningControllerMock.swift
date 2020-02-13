//
//  SigningControllerMock.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation
@testable import EthSampleApp

class SigningControllerMock: SigningViewController {

   override func viewDidLoad() {
       self.title = self.viewModel.getTitle()
   }

}
