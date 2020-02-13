//
//  SetupViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
class SetupViewController: UIViewController
{
    var viewModel : SetupViewModel!
    @IBOutlet weak var txtPrivateKey : BaseUITextfield!{
        didSet{
            txtPrivateKey.delegate = self
        }
    }
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtPrivateKey.resignFirstResponder()
    }
    
}
// MARK: Custom Functions
extension SetupViewController{
    private func setupView(){
        self.viewModel.testAccount()
        self.txtPrivateKey.text = self.viewModel.getPkKey()
        self.title = self.viewModel.getTitle()
    }
    private func goToAccount(){
        let msg = self.txtPrivateKey.text ?? ""
        if Utility.validateMessage(message: msg){
            self.viewModel.didTapOnDone(msg) { [weak self] (vc) in
                guard let vc = vc else {
                    return
                }
                self?.navigationController?.makeInitialVC(vc)
            }
        }
        else{
            showEnterMessageAlert()
        }
    }
    func showEnterMessageAlert(){
        Alert.instance.showAlert(Title: "", Message: AlertMessage.enterPrivateKey, ButtonTitle: AlertMessage.okButtonTitle, View: self) {
            self.txtPrivateKey.becomeFirstResponder()
        }
    }
}
// MARK: Textfield Delegates
extension SetupViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtPrivateKey{
            self.goToAccount()
        }
        textField.resignFirstResponder()
        return true
    }
}
