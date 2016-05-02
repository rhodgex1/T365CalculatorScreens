//
//  TouchIdController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/2/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TouchIdController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Touch ID"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- user actions
extension TouchIdController {
    
    @IBAction func enableTouchId(sender: UISwitch) {
    }
}
