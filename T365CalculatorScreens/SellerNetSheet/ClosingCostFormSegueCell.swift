//
//  ClosingCostFormSegueCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/21/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ClosingCostFormSegueCell: ClosingCostFormBaseCell {
    
    static let cellIdentifier = "ClosingCostFormSegueCell"
    var segueIdentifier: String!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func populateWithData(closingCost: ClosingCost) {
        super.populateWithData(closingCost)
        segueIdentifier = closingCost.segueIdentifier!
    }
}
