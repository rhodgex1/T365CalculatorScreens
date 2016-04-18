//
//  BrokerFeeForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class BrokerFeeForm: UITableViewController, DismissKeyboardOnOutsideTap {

    var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView = view
        configureToDismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}
