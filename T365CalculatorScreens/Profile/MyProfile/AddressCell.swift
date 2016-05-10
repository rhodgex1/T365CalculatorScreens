//
//  AddressCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/9/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

typealias AddNewAddressHandler = () -> Void

//MARK:- Address Title Cell
class AddresTitleCell: UITableViewCell {
    static let cellIdentifier = "AddresTitleCell"
}

//MARK:- Address Cell
class AddressCell: UITableViewCell {
    static let cellIdentifier = "AddressCell"
    
    //MARK:- Outlets declarations
    
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var state: UITextField!

    func populateWithData(address: Address) {
        type.text = address.type
        address1.text = address.address1
        address2.text = address.address2
        city.text = address.city
        zipcode.text = address.zipCode
        state.text = address.state
    }
}


//MARK:- Add New Address Cell
class AddNewAddressCell: UITableViewCell {
    static let cellIdentifier = "AddNewAddressCell"
    var addNewAddressHandler : AddNewAddressHandler!
    
    @IBAction func addNewAddress(sender: UIButton) {
        addNewAddressHandler()
    }
}

