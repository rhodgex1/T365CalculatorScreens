//
//  EditProfileTableViewController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/31/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit
import CoreData

enum EditProfileTableViewSection : Int, CaseCountable {
    case PersonalInfo = 0
    case ContactDetails = 1
    case Address = 2
    case SocialAndWeblink = 3
    case Profile = 4
    
    static let caseCount = TableViewSection.countCases()
}

struct EditProfileCellMeta {
    let cell: CellPlotsAndPopulates
    let cellHeight: CGFloat
}

protocol CellPlotsAndPopulates {
    func plot()
    func populate(mo: NSManagedObject?)
}

protocol CellLogsValues {
    func cellLog()
}

extension CellLogsValues {
    func cellLog() {
        // printing empty description
        print("")
    }
}

extension CellPlotsAndPopulates {
    func populate(mo: NSManagedObject?) {
        // empty definition for optional method
    }
}

class EditProfileTableViewController: UITableViewController {
    static let embedSegue = "EmbedEditProfileViewController"
    var cellsMetaDict = [EditProfileTableViewSection: [EditProfileCellMeta]]()
    
    @IBOutlet var editProfileTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCellsMetaDict()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - Cell setup
extension EditProfileTableViewController{
    private func updateCellsMetaDict() {
        // add personal info cell
        cellsMetaDict[.PersonalInfo] = [getPersonalInfoTableViewCellMeta()]
        
        // add contact details cell
        cellsMetaDict[.ContactDetails] = [getContactDetailsTableViewCellMeta()]
        
        // add business address cell
        cellsMetaDict[.Address] = [getBusinessAddressCellMeta()]
        
        // add social cells
        //Note: add in order
        cellsMetaDict[.SocialAndWeblink] = [getSocialLinkTitleCellMeta(), getSocialLinkCellMeta(0), getSocialLinkAddCellMeta()]
        
        // add profile cells
        cellsMetaDict[.Profile] = [getProfileTableViewCellMeta()]
    }
    
    private func getSocialLinkCellMeta(row: Int) -> EditProfileCellMeta {
        let socialLinkCell = SocialLinkCell()
        socialLinkCell.plot()
        let socialLinkCellMeta = EditProfileCellMeta(cell: socialLinkCell, cellHeight: SocialLinkCell.cellHeight)
        return socialLinkCellMeta
    }
    
    private func getSocialLinkTitleCellMeta() ->  EditProfileCellMeta {
        let socialLinkTitleCell = SocialLinkTitleCell()
        socialLinkTitleCell.plot()
        let socialLinkTitleCellMeta = EditProfileCellMeta(cell: socialLinkTitleCell, cellHeight: SocialLinkTitleCell.cellHeight)
        return socialLinkTitleCellMeta
    }
    
    private func getSocialLinkAddCellMeta() ->  EditProfileCellMeta {
        let socialLinkAddCell = SocialLinkAddCell()
        socialLinkAddCell.plot()
        let socialLinkAddCellMeta = EditProfileCellMeta(cell: socialLinkAddCell, cellHeight: SocialLinkAddCell.cellHeight)
        return socialLinkAddCellMeta
    }
    
    private func getPersonalInfoTableViewCellMeta() ->  EditProfileCellMeta {
        let personalInfoTableViewCell = PersonalInfoTableViewCell()
        personalInfoTableViewCell.plot()
        let personalInfoTableViewCellMeta = EditProfileCellMeta(cell: personalInfoTableViewCell, cellHeight: PersonalInfoTableViewCell.cellHeight)
        return personalInfoTableViewCellMeta
    }
    
    private func getContactDetailsTableViewCellMeta() ->  EditProfileCellMeta {
        let contactDetailsTableViewCell = ContactDetailsTableViewCell()
        contactDetailsTableViewCell.plot()
        let contactDetailsTableViewCellMeta = EditProfileCellMeta(cell: contactDetailsTableViewCell, cellHeight: ContactDetailsTableViewCell.cellHeight)
        return contactDetailsTableViewCellMeta
    }
    
    private func getBusinessAddressCellMeta() ->  EditProfileCellMeta {
        let businessAddressCell = BusinessAddressCell()
        businessAddressCell.plot()
        let businessAddressCellMeta = EditProfileCellMeta(cell: businessAddressCell, cellHeight: BusinessAddressCell.cellHeight)
        return businessAddressCellMeta
    }
    
    private func getProfileTableViewCellMeta() ->  EditProfileCellMeta {
        let profileTableViewCell = ProfileTableViewCell()
        profileTableViewCell.plot()
        let profileTableViewCellMeta = EditProfileCellMeta(cell: profileTableViewCell, cellHeight: ProfileTableViewCell.cellHeight)
        return profileTableViewCellMeta
    }
}

// MARK: - Table view data source
extension EditProfileTableViewController{
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellsMetaDict.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableViewSection = EditProfileTableViewSection(rawValue: section), cells = cellsMetaDict[tableViewSection] {
            return cells.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let tableViewSection = EditProfileTableViewSection(rawValue: indexPath.section), cellsMeta = cellsMetaDict[tableViewSection] {
            let editProfileCellMeta = cellsMeta[indexPath.row]
            let editProfileCell = editProfileCellMeta.cell
            cell = editProfileCell as! UITableViewCell
        }
        return cell
    }
}

// MARK: - Table view delegate
extension EditProfileTableViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let tableViewSection = EditProfileTableViewSection(rawValue: indexPath.section), cellsMeta = cellsMetaDict[tableViewSection] {
            let editProfileCellMeta = cellsMeta[indexPath.row]
            return editProfileCellMeta.cellHeight
        }
        else {
            return 0
        }
    }
}
