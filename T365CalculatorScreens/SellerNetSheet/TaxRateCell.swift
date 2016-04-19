//
//  TaxRateCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TaxRateCell: UITableViewCell {
    // declaring outlets
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var cityStateName: UITextField!
    @IBOutlet weak var propertyRateSelection: UIButton!
    
    static let cellIdentifier = "TaxRateCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateWithData(propertyTaxRate: PropertyTaxRate) {
        taxRate.text = "\(propertyTaxRate.taxRate)"
        cityStateName.text = "\(propertyTaxRate.city), \(propertyTaxRate.state)"
        propertyRateSelection.selected = propertyTaxRate.isSelected
    }

}
