//
//  SocialAndWeblinkCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/10/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

typealias AddNewSocialAndWeblinkHandler = () -> Void

//MARK:- SocialAndWeblinkTitleCell
class SocialAndWeblinkTitleCell: UITableViewCell {
    static let cellIdentifier = "SocialAndWeblinkTitleCell"
}

//MARK:- SocialAndWeblinkCell
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


//MARK:- AddNewSocialAndWeblinkCell
class AddNewSocialAndWeblinkCell: UITableViewCell {
    static let cellIdentifier = "AddNewSocialAndWeblinkCell"
    var addNewSocialAndWeblinkHandler : AddNewSocialAndWeblinkHandler!
    
    @IBAction func addNewLink(sender: UIButton) {
        addNewSocialAndWeblinkHandler()
    }

}