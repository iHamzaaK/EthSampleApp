//
//  SigningViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit

class SigningViewController: UIViewController
{
    @IBOutlet weak var txtMsg : BaseUITextfield!{
        didSet{
            txtMsg.delegate = self
        }
    }
    @IBOutlet weak var imgQRView: UIImageView!
    var viewModel : SigningViewModel!
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtMsg.resignFirstResponder()
    }
}
// MARK: Custom Functions
extension SigningViewController{
    private func setupView(){
        self.title = self.viewModel.getTitle()
    }
}
// MARK: Textfield Delegate
extension SigningViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
// MARK: IBActions
extension SigningViewController{
    @IBAction func didTapOnSign(_ sender : UIButton){
        self.txtMsg.resignFirstResponder()
        guard let message = self.txtMsg.text else { return }
        if Utility.validateMessage(message: message){
            self.viewModel.didTapOnSign(message) { (img) in
                guard let img = img else { return }
                DispatchQueue.main.async {
                    let vc  = SignatureBuilder.build(img, msg: message)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        else{
            Alert.instance.showAlert(Title: AlertMessage.title, Message: AlertMessage.textForQrNotEntered, ButtonTitle: AlertMessage.okButtonTitle, ButtonCompletionHandler: {
                self.txtMsg.becomeFirstResponder()
            }, View: self) {}
        }
        
    }
}
