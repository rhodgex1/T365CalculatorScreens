//
//  TaxesController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TaxesController: SellerNetSheetWithContainersBaseController {
    var taxesFormController : TaxesForm!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Taxes"
        
        // Note: header controller (netProceedsController) is being set in its super class
        taxesFormController = bodyContentController as! TaxesForm
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
