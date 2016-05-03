//
//  FeedbackForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/3/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class FeedbackForm: UITableViewController {
    // declaring outlets
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var deviceModel: UILabel!
    @IBOutlet weak var osVersion: UILabel!
    @IBOutlet weak var appVersion: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
