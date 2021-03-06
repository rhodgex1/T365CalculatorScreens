//
//  AccountExecutiveHomeController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/12/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class AccountExecutiveHomeController: HomeBaseController {

    //MARK:- Binding outlets
    @IBOutlet weak var projectedPremiumsAmount: UILabel!
    @IBOutlet weak var closingsCount: UILabel!
    @IBOutlet weak var officeCount: UILabel!
    @IBOutlet weak var companyCount: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var mySalesPagerController:MySalesPagerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier where segueIdentifier == MySalesPagerController.embedSegue {
            mySalesPagerController = segue.destinationViewController as! MySalesPagerController
        }
    }
}

//MARK:- User actions
extension AccountExecutiveHomeController {
    
    @IBAction func moreDetail(sender: UIButton) {
    }
}
