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
    
    // declaring outlets
    @IBOutlet weak var totalBrokerFeeAmount: UITextField!
    @IBOutlet weak var totalBrokerFeePercentage: UITextField!
    @IBOutlet weak var listingBrokerFeeAmount: UITextField!
    @IBOutlet weak var listingBrokerFeePercentage: UITextField!
    @IBOutlet weak var buyerBrokerFeeAmount: UITextField!
    @IBOutlet weak var buyerBrokerFeePercentage: UITextField!
    
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
