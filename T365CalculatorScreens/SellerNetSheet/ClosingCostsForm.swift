//
//  ClosingCostsForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ClosingCostsForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    // declaring IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var escrow: UITextField!
    @IBOutlet weak var recording: UITextField!
    @IBOutlet weak var notary: UITextField!
    @IBOutlet weak var homeWarranty: UITextField!
    @IBOutlet weak var termiteReport: UITextField!
    @IBOutlet weak var naturalHazardDisclosureReport: UITextField!
    @IBOutlet weak var hoaTransfer: UITextField!
    @IBOutlet weak var hoaProratedDues: UITextField!
    @IBOutlet weak var reconveyance: UITextField!
    @IBOutlet weak var taxCertificate: UITextField!
    @IBOutlet weak var repairs: UITextField!
    
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
