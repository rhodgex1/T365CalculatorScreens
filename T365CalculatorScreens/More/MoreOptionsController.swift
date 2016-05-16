//
//  MoreOptionsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class MoreOptionsController: UITableViewController, DismissKeyboardOnOutsideTap {
    static let embedSegueIdentifier = "EmbedMoreOptions"
    var backgroundView: UIView!
    var moreScreenType: MoreScreenType!

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView = view
        configureToDismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Private methods
extension MoreOptionsController {
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}

//MARK:- UITableViewDelegate methods
extension MoreOptionsController {
    // below code is added to hide ContactCell in one of the cases
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        var cellHeight = super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        if let cellIdentifier = cell.reuseIdentifier where cellIdentifier == "ContactsCell" {
            if moreScreenType == .More {
                cellHeight = 0
            }
        }
        
        return cellHeight
    }
}