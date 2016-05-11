//
//  CircularImageView.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class CircularImageView: UIImageView {
    // properties with default values
    var borderColor = UIColor.whiteColor()
    var borderWidth : CGFloat = 1.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderWidth = borderWidth
        layer.cornerRadius = frame.width / 2
        layer.borderColor = borderColor.CGColor
    }
}
