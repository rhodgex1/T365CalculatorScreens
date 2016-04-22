//
//  FinancingForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

enum FinancingTypeSelectionButtonTag : Int {
    case Conventional = 101
    case FHA = 102
    case VA = 103
    case OwnerFinancing = 104
    case AllCash = 105
}

class FinancingForm: UITableViewController , DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    // declaring IBoutlets
    @IBOutlet weak var interestRate: UITextField!

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
extension FinancingForm {
    
    @IBAction func selectContent(sender: UIButton) {
        sender.selected = !sender.selected
        
        // perform action based on button tag
        if let financingType = FinancingTypeSelectionButtonTag(rawValue:sender.tag) {
            switch financingType {
                case .Conventional:
                    // perform conventional related action
                    print("Conventional selected");
                case .FHA:
                // perform FHA related action
                    print("FHA selected");
                case .VA:
                    // perform VA related action
                    print("VA selected");
                case .OwnerFinancing:
                    // perform OwnerFinancing related action
                    print("OwnerFinancing selected");
                case .AllCash:
                    // perform AllCash related action
                    print("AllCash selected");
            }
        }
    }
}
