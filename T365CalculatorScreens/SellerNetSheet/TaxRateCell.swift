//
//  TaxRateCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TaxRateCell: UITableViewCell {
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var cityStateName: UITextField!
    
    static let cellIdentifier = "TaxRateCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
