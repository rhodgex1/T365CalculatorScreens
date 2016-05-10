//
//  SocialAndWeblinkCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/10/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

typealias AddNewSocialAndWeblinkHandler = () -> Void

//MARK:- Address Title Cell
class SocialAndWeblinkTitleCell: UITableViewCell {
    static let cellIdentifier = "SocialAndWeblinkTitleCell"
}

//MARK:- Address Cell
class SocialAndWeblinkCell: UITableViewCell {
    static let cellIdentifier = "SocialAndWeblinkCell"
    
    //MARK:- Outlets declarations
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var url: UITextField!
    
    func populateWithData(socialAndWeblink: SocialAndWeblink) {
        name.text = socialAndWeblink.name
        url.text = socialAndWeblink.url
    }
}


//MARK:- Add New Address Cell
class AddNewSocialAndWeblinkCell: UITableViewCell {
    static let cellIdentifier = "AddNewSocialAndWeblinkCell"
    var addNewSocialAndWeblinkHandler : AddNewSocialAndWeblinkHandler!
    
    @IBAction func addNewLink(sender: UIButton) {
        addNewSocialAndWeblinkHandler()
    }

}