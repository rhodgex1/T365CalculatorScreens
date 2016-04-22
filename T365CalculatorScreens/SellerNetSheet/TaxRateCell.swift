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
    @IBOutlet weak var taxRateName: UITextField!
    @IBOutlet weak var propertyRateSelection: UIButton!
    
    weak var parentViewController: PropertyTaxRateController!
    
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
        if let aTaxRate = propertyTaxRate.taxRate {
            taxRate.text = "\(aTaxRate)"
        }
        
        taxRateName.text = propertyTaxRate.taxRateName
        propertyRateSelection.selected = propertyTaxRate.isSelected
    }

    // below method is added to support check uncheck functionality on tap of circular button
    @IBAction func selectionAction(sender: AnyObject) {
        parentViewController.updateSelectionForCell(self)
    }

}
