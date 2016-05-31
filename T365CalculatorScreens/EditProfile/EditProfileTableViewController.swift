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
    case ContactDetails = 3
    case Address = 2
    case SocialAndWeblink = 1
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

extension CellPlotsAndPopulates {
    func populate(mo: NSManagedObject?) {
        // empty definition for optional method
    }
}

class EditProfileTableViewController: UITableViewController {
    var cellsMetaDict = [EditProfileTableViewSection: [EditProfileCellMeta]]()
    
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
        
        // add social cells
        //Note: add in order
        cellsMetaDict[.SocialAndWeblink] = [getSocialLinkTitleCellMeta(), getSocialLinkCellMeta(0), getSocialLinkAddCellMeta()]
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
