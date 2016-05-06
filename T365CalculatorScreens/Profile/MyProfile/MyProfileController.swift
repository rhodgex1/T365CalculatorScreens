//
//  MyProfileController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/5/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

protocol EmbedUserInfo {
    var userInfoController: UserInfoController! { get }
}

protocol EmbedContact {
    var contactController: ContactController! { get }
}

class MyProfileController: UIViewController, EmbedUserInfo, EmbedContact{

    //MARK:- Var declarations
    var userInfoController: UserInfoController!
    var contactController: ContactController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "My Profile"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == UserInfoController.embedSegueIdentifier {
                userInfoController = segue.destinationViewController as! UserInfoController
                userInfoController.showContactButton = false
            }
            else if segueIdentifier == ContactController.embedSegueIdentifier {
                contactController = segue.destinationViewController as! ContactController
            }
            else {
                // do nothing :-)
            }
        }
    }
}

//MARK:- User actions
extension MyProfileController {
    
    @IBAction func moreAction(sender: UIBarButtonItem) {
    }
}