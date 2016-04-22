//
//  PayoffCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/20/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class PayoffCell: UITableViewCell {
    static let cellIdentifier = "PayoffCell"

    // declaration of IBOutlets
    @IBOutlet weak var payoffAmount: UITextField!
    @IBOutlet weak var payoffTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populateWithData(payoff: Payoff) {
        if let amount = payoff.amount {
            payoffAmount.text = "\(amount)"
        }
        
        payoffTitle.text = payoff.title
    }
}
