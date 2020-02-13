//
//  Alert.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 10/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit

class Alert {
    static let instance : Alert = Alert()
    private init(){}
    func showAlert(Title title : String, Message message : String , ButtonTitle buttonTitle : String, ButtonCompletionHandler compHandler : @escaping ()->Void , View vc : UIViewController, completionHandler: @escaping ()->Void){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            compHandler()
        }
        alert.addAction(alertAction)
        vc.present(alert, animated: true) {
            completionHandler()
        }
    }
    func showAlert(Title title : String, Message message : String , ButtonTitle buttonTitle : String,View vc : UIViewController, completionHandler:@escaping ()->Void){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .default)
        alert.addAction(alertAction)
        vc.present(alert, animated: true) {
            completionHandler()
        }
    }
}
