//
//  EditProfileController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/9/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//MARK:- Enum declarations
enum TableViewSection : Int {
    case PersonalInfo = 1
    case ContactDetails = 2
    case Address = 3
}

//MARK:- Struct declarations
struct PersonalInfo {
    var firstName: String
    var lastName: String
    var company: String
    var title: String
}

struct ContactDetails {
    var mobilePhone: String
    var secondaryPhone: String
    var emailAddress: String
}

struct Address {
    var type: String
    var address1: String
    var address2: String
    var city: String
    var state: String
    var zipCode: String
}

//MARK:- class
class EditProfileController: UIViewController {
    //MARK:- Outlets declarations
    @IBOutlet weak var editProfileTable: UITableView!
    
    //MARK:- var declarations
    var personalInfo : PersonalInfo!
    var contactDetails: ContactDetails!
    var address: [Address]!
    
    var sections: [TableViewSection]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sections = [.PersonalInfo, .ContactDetails, .Address]
        populateEmptyData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- private functions
extension EditProfileController {
    private func populateEmptyData() {
        personalInfo = PersonalInfo(firstName: "", lastName: "", company: "", title: "")
        contactDetails = ContactDetails(mobilePhone: "", secondaryPhone: "", emailAddress: "")
        address = [Address(type:"Home", address1: "1234 Tidal Lane", address2: "", city: "Sunnyshore", state: "CA", zipCode: "94144")]
    }
}

//MARK:- Implementing UITableViewDataSource methods
extension EditProfileController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsCount = 0
        
        if let tableViewSection = TableViewSection(rawValue: section) {
            switch tableViewSection{
                case .PersonalInfo:
                    rowsCount = 1
                case .ContactDetails:
                    rowsCount = 1
                case .Address:
                    // added 2 for title and add new address row
                    rowsCount = address.count + 2
            }
        }
        
        return rowsCount
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        var cell : UITableViewCell!
        
        if let tableViewSection = TableViewSection(rawValue: section) {
            switch tableViewSection{
            case .PersonalInfo:
                cell = tableView.dequeueReusableCellWithIdentifier(PersonalInfoCell.cellIdentifier, forIndexPath: indexPath)
            case .ContactDetails:
                cell = tableView.dequeueReusableCellWithIdentifier(ContactDetailsCell.cellIdentifier, forIndexPath: indexPath)
            case .Address:
                if indexPath.row == 0 {
                    // show title
                    cell = tableView.dequeueReusableCellWithIdentifier(AddresTitleCell.cellIdentifier, forIndexPath: indexPath)
                }
                else if indexPath.row == address.count + 1 {
                    // show AddNewAddress
                    cell = tableView.dequeueReusableCellWithIdentifier(AddNewAddressCell.cellIdentifier, forIndexPath: indexPath)
                }
                else {
                    // show data cells
                    cell = tableView.dequeueReusableCellWithIdentifier(AddressCell.cellIdentifier, forIndexPath: indexPath)
                }
            }
        }
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
}