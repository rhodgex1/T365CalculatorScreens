//
//  EscrowForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class EscrowForm: UITableViewController , DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    // declaring IBoutlets
    @IBOutlet weak var escrowSettlement: UITextField!
    @IBOutlet weak var escrowPaidBy: UISegmentedControl!
    @IBOutlet weak var subEscrow: UITextField!
    @IBOutlet weak var subEscrowPaidBy: UISegmentedControl!
    @IBOutlet weak var docPrep: UITextField!
    @IBOutlet weak var demand: UITextField!
    
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

//MARK:- user actions
extension EscrowForm {
    
    @IBAction func subEscrowInfoAction(sender: AnyObject) {
    }
}