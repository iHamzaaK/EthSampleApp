//
//  QRScannerViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import AVFoundation
class QRScannerViewController: UIViewController
{
    @IBOutlet weak var scannerView: QRScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }
    var viewModel : QRScannerViewModel!
    // MARK: View lifecycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        scannerView.startScanning()
    }
}
// MARK: Custom Functions
extension QRScannerViewController {
    func setupView(){
        self.title = self.viewModel.getTitle()
    }
}
// MARK: QRScanner Delegate
extension QRScannerViewController: QRScannerViewDelegate {
    func qrScanningDidStop() {
    }
    func qrScanningDidFail() {
        Alert.instance.showAlert(Title: AlertMessage.title, Message: AlertMessage.qrFailure, ButtonTitle: AlertMessage.okButtonTitle, View: self) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func qrScanningSucceededWithCode(_ str: String?) {
        let success = self.viewModel.validateSignature(str: str ?? "")
        var message = ""
        if success{
            message = AlertMessage.signatureValid
        }
        else{
            message = AlertMessage.signatureInvalid
        }
        Alert.instance.showAlert(Title: "", Message: message, ButtonTitle: AlertMessage.okButtonTitle, ButtonCompletionHandler: {
            self.navigationController?.popViewController(animated: true)
        }, View: self) {
        }
    }
}
