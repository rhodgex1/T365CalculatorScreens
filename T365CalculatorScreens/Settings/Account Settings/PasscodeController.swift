//
//  PasscodeController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/2/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class PasscodeController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Passcode"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension PasscodeController {
    
    @IBAction func enablePasscode(sender: UISwitch) {
    }
}