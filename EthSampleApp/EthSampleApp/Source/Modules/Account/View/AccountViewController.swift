//
//  AccountViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift

class AccountViewController: UIViewController
{
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    var viewModel : AccountViewModel!
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
    }
}
// MARK: Custom Functions
extension AccountViewController{
    private func setupView(){
        self.title = self.viewModel.getTitle()
        self.viewModel.getBalance { [unowned self] (balance) in
            DispatchQueue.main.async {
                self.lblBalance.text = balance
            }
        }
        self.lblAddress.text = self.viewModel.getAddress()
    }
}
// MARK: IBActions
extension AccountViewController {
    @IBAction func didTapOnVerify(_ sender : UIButton){
        self.viewModel.didTapOnVerify { [weak self] (vc) in
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func didTapOnSign(_ sender : UIButton){
        self.viewModel.didTapOnSign { [weak self] (vc) in
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
