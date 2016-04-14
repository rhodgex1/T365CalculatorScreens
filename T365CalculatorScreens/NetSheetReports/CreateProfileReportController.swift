//
//  CreateProfileReportController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/14/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class CreateProfileReportController: UIViewController {

    @IBOutlet weak var footerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Profile Report"
        configureFooterView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// private methods
extension CreateProfileReportController {
    private func configureFooterView() {
        footerView.layer.borderWidth = 1.0
        footerView.layer.borderColor = UIColor(red: 223/255.0, green: 223/255.0, blue: 223/255.0, alpha: 1.0).CGColor
    }
}


// User actions
extension CreateProfileReportController {
    
    @IBAction func resetAction(sender: AnyObject) {
        //TODO: complete implementation
    }

    @IBAction func previewAction(sender: AnyObject) {
        //TODO: complete implementation
    }
}