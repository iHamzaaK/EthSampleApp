//
//  SignatureViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit

class SignatureViewController: UIViewController
{
    @IBOutlet weak var imgQRView: UIImageView!
    @IBOutlet weak var lblMessage : UILabel!
    var viewModel : SignatureViewModel!
    // MARK: View lifecycle
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupView()
    }
}
// MARK: Custom Functions
extension SignatureViewController{
    private func setupView(){
        self.title = self.viewModel.getTitle()
        self.imgQRView.image = self.viewModel.getImage()
        self.lblMessage.text = self.viewModel.getMessage()
    }
}
