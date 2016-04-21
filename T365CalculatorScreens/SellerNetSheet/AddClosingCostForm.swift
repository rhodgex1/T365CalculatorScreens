//
//  AddClostingCostForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/21/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class AddClosingCostForm: UITableViewController , DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!

    @IBOutlet weak var newClosingCostName: UITextField!
    @IBOutlet weak var newClosingCostValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView = view
        configureToDismissKeyboard()
        
        title = "Add Closting Cost"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}
