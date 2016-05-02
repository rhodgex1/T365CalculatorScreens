//
//  SettingsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/2/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {

    // IBOutlets
    @IBOutlet var settingsTable: UITableView!
    
    // enable or disable below flag to display only settings with AE or without AE
    var ifEnableSettingsAE = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        
        //FIXME: background color of tableview below app version cell should be r:242, g:242, b:242
        settingsTable.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Tableview delegate methods
extension SettingsController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if ifEnableSettingsAE {
            if let cellReuseIdentifier = super.tableView(tableView, cellForRowAtIndexPath: indexPath).reuseIdentifier where (cellReuseIdentifier == "NonAEHeaderCell" || cellReuseIdentifier == "NonAECell"){
                return 0
            }
        }
        
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
}

//MARK:- private methods
extension SettingsController {
    private func showSettingsAE() {
       
    }
}
