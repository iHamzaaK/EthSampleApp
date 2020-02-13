//
//  BaseUITextfield.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit

class BaseUITextfield: UITextField {
    
    let xInset : CGFloat = 10
    let yInset : CGFloat = 0
    override func awakeFromNib() {
        customize()
    }
    private func customize(){
        customizeBgColor()
        customizeLayer()
    }
    private func customizeLayer(){
        self.layer.cornerRadius = 5
    }
    private func customizeBgColor(){
        self.backgroundColor = UIColor.init(hexString: Constants.textFieldBgColor)
    }
}
// MARK: Textfield Custom Position
extension BaseUITextfield{
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: xInset , dy: yInset)
    }
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: xInset , dy: yInset)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: xInset, dy: yInset)
    }
}
