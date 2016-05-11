//
//  CircularView.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class CircularView: UIView {
    var borderColor : UIColor?
    var borderWidth : CGFloat?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = frame.width / 2
    }
    
    override func awakeFromNib() {
        // the properties are moved to awakeFromNib because at this instance user defined runtime attributes return non-nil values, if assigned
        // we can either specify below properties programmatically or 
        // we can assign through user defined runtime attributes in Identity Inspector
        if borderColor == nil {
            borderColor = UIColor.clearColor()
        }
        layer.borderColor = borderColor!.CGColor
        
        if borderWidth == nil {
            borderWidth = 1.0
        }
        layer.borderWidth = borderWidth!
        
        if backgroundColor == nil {
            backgroundColor = UIColor.whiteColor()
        }
        
        
        
    }
}
