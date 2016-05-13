//
//  RelationshipsCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class RelationshipsCell: UITableViewCell {

    static let cellIdentifier = "RelationshipsCell"
    
    //MARK: IBOutlets
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personDesignation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateWithData(teamMember: TeamMember){
        if let anImage = teamMember.personImage {
            personImageView.image = anImage
        }
        
        personName.text = teamMember.personName
        personDesignation.text = teamMember.personDesignation
    }

}
