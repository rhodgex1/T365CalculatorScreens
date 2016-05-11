//
//  MoreOptionsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class MoreOptionsController: UITableViewController, DismissKeyboardOnOutsideTap {
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
}

//MARK:- Private methods
extension MoreOptionsController {
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}