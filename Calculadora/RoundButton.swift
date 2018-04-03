//
//  RoundButton.swift
//  Calculadora
//
//  Created by Daniel Sanabria on 16/03/18.
//  Copyright © 2018 Daniel Sanabria. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

 
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
    }
    
    
    @IBInspectable
    var roundButton:Bool = false {
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    
    
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
        sharedInit()
    }
    
}
