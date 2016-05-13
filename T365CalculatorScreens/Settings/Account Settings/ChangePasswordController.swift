//
//  ChangePasswordController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/2/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ChangePasswordController: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    //declaring outlets
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmNewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Change Password"
        
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
