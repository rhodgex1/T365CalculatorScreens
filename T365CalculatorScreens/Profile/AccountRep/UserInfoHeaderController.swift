//
//  UserInfoHeaderController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class UserInfoHeaderController: UIViewController {

    //MARK:- IBOutlets declarations
    @IBOutlet weak var personImage: CircularImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personDesignation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier where segueIdentifier == "ShowContactActions" {
            let contactActionsController = segue.destinationViewController
            contactActionsController.view.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        }
    }

}

//MARK:- User actions
extension UserInfoHeaderController {
    
    @IBAction func callAction(sender: UIButton) {
    }

}
