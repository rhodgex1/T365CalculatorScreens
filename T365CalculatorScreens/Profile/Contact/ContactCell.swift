//
//  ContactCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    static let cellIdentifier = "ContactCell"
    
    //MARK:- Binding outlets
    @IBOutlet weak var contactImage: CircularImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactProfile: UILabel!
    @IBOutlet weak var contactStarImage: UIImageView!
    @IBOutlet weak var contactStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
