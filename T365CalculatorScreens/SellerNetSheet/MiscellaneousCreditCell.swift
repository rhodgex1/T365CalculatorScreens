//
//  MiscellaneousCreditCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/22/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class MiscellaneousCreditCell: UITableViewCell {
    static let cellIdentifier = "MiscellaneousCreditCell"

    // declaration of IBOutlets
    @IBOutlet weak var miscellaneousCreditAmount: UITextField!
    @IBOutlet weak var miscellaneousCreditTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateWithData(aMiscellaneousCredit: MiscellaneousCredit) {
        if let amount =  aMiscellaneousCredit.amount{
            miscellaneousCreditAmount.text = "\(amount)"
        }
        
        miscellaneousCreditTitle.text = aMiscellaneousCredit.title
    }

}
