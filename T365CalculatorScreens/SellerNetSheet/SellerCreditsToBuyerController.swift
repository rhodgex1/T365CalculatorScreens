//
//  SellerCreditsToBuyerController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class SellerCreditsToBuyerController: SellerNetSheetWithContainersBaseController {
    var sellerCreditsToBuyerFormController: SellerCreditsToBuyerForm!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Seller Credits to Buyer"
        
        // Note: header controller (netProceedsController) is being set in its super class
        sellerCreditsToBuyerFormController = bodyContentController as! SellerCreditsToBuyerForm
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- User actions
extension SellerCreditsToBuyerController {
    
    @IBAction func addFormRow(sender: AnyObject) {
        sellerCreditsToBuyerFormController.addNewRow()
    }
}