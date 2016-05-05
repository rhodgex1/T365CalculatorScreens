//
//  ContactActionsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/5/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ContactActionsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- User actions
extension ContactActionsController {
    
    @IBAction func email(sender: UIButton) {
    }
    @IBAction func call(sender: UIButton) {
    }
    @IBAction func cancel(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func text(sender: UIButton) {
    }
}