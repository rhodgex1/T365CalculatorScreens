//
//  PayoffsForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class PayoffsForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    // declaring IBoutlets
    @IBOutlet weak var payoff1: UITextField!
    @IBOutlet weak var payoff2: UITextField!
    @IBOutlet weak var payoff3: UITextField!
    
    
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
