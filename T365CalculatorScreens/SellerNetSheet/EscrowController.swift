//
//  EscrowController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class EscrowController: SellerNetSheetWithContainersBaseController {
    var escrowFormController : EscrowForm!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Escrow"
        
        // Note: header controller (netProceedsController) is being set in its super class
        escrowFormController = bodyContentController as! EscrowForm
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
