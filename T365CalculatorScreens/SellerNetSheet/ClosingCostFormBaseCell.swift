//
//  ClosingCostFormBaseCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/21/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ClosingCostFormBaseCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateWithData(closingCost: ClosingCost) {
        if let closingCostValue = closingCost.value{
            value.text = "\(closingCostValue)"
        }
        
        title.text = closingCost.title
    }

}
