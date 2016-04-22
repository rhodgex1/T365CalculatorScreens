//
//  TitleController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class TitleController: SellerNetSheetWithContainersBaseController {
    var titleFormController : TitleForm!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Title"
        
        // Note: header controller (netProceedsController) is being set in its super class
        titleFormController = bodyContentController as! TitleForm
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
