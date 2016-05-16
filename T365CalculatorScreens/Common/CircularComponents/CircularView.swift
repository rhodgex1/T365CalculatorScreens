//
//  CircularView.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

@IBDesignable
class CircularView: CustomView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        cornerRadius = frame.width / 2
    }
}
