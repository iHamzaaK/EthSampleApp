//
//  SignatureViewModel.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit

class SignatureViewModel
{
    private var title : String!
    private var img : UIImage!
    private var msg : String
    init(_ title : String, _ img : UIImage, msg : String){
        self.title = title
        self.img = img
        self.msg = msg
    }
    
    func getTitle()->String{
        return title
    }
    func getImage()->UIImage{
        return img
    }
    func getMessage()->String{
        return "\(Constants.messageLabel) \(msg)"
    }
    
}
