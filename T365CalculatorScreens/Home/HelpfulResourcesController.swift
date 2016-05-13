//
//  HelpfulResourcesController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/13/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class HelpfulResourcesController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Helpful Resources"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
