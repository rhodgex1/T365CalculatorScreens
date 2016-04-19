//
//  TaxesForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TaxesForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    // declaring outlets
    @IBOutlet weak var taxablePropertyValue: UITextField!
    @IBOutlet weak var propertyTaxRate: UITextField!
    @IBOutlet weak var annualPropertyTaxes: UITextField!
    @IBOutlet weak var currentYearProratedPropertyTaxes: UITextField!
    @IBOutlet weak var countyTransferPaidBy: UISegmentedControl!
    @IBOutlet weak var countyTransferTaxRate: UITextField!
    @IBOutlet weak var countyTransferTaxes: UITextField!
    @IBOutlet weak var cityTransferTaxesPaidBy: UISegmentedControl!
    @IBOutlet weak var cityTransferTaxRate: UITextField!
    @IBOutlet weak var cityTransferTaxes: UITextField!
    
    
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
