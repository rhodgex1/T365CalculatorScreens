//
//  EditImageController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/10/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class EditImageController: UIViewController {
    @IBOutlet weak var userImage: CircularImageView!

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
extension EditImageController {
    
    @IBAction func editPhoto(sender: UIButton) {
    }
}