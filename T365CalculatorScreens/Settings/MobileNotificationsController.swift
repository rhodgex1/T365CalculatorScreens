//
//  MobileNotificationsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/2/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class MobileNotificationsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Mobile Notifications"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- User actions
extension MobileNotificationsController {
    
    @IBAction func marketSummaryAction(sender: UISwitch) {
    }

    @IBAction func profileRemindersAction(sender: UISwitch) {
    }
    
    @IBAction func farmUpdatesAction(sender: UISwitch) {
    }
    
    @IBAction func saveSearchUpdatesAction(sender: UISwitch) {
    }
    
    @IBAction func profileUpdatesAction(sender: UISwitch) {
    }
}