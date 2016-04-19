//
//  TitleForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TitleForm: UITableViewController , DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!

    // declaring IBoutlets
    @IBOutlet weak var ownerPolicyAmount: UITextField!
    @IBOutlet weak var ownerPolicyPaidBy: UISegmentedControl!
    @IBOutlet weak var lenderPolicyAmount: UITextField!
    @IBOutlet weak var lenderPolicyPaidBy: UISegmentedControl!
    @IBOutlet weak var policyGuarantee: UITextField!
    
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
