//
//  PreviewController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/20/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class PreviewController: UIViewController {
    @IBOutlet weak var previewWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Preview"
        
        // dummy url loading 
        UIWebView.loadRequest(previewWebView)(NSURLRequest(URL: NSURL(string: "http://xomelabs.com/")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
