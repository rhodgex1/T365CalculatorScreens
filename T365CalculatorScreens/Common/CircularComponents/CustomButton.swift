//
//  BorderedView.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/16/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    //MARK:- Declaring inspectable properties
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
