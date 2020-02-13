//
//  VerificationViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
class VerificationViewController: UIViewController
{
    var viewModel : VerificationViewModel!
    @IBOutlet weak var txtMessage : BaseUITextfield!{
        didSet{
            txtMessage.delegate = self
        }
    }
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
    }
    
}
extension VerificationViewController{
    private func setupView(){
        self.title = self.viewModel.getTitle()
    }
}
extension VerificationViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension VerificationViewController{
    @IBAction func didTapOnSign(_ sender : UIButton){
        self.txtMessage.resignFirstResponder()
        guard let message = txtMessage.text else { return }
        self.viewModel.didTapOnSign(message) { (data) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                let vc =   QRScannerBuilder.build(signature: data, wallet: self.viewModel.getWallet())
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
