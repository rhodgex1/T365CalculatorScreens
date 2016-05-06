//
//  ProfileContactDetailController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ProfileContactDetailController: UIViewController {

    //MARK:- Constant declarations
    static let storyboardId = "ProfileContactDetailController"
    static let embedSegueIdentifier = "EmbedContact"
    
    //MARK:- Declaring IBOutlets
    @IBOutlet weak var officeAddress: UILabel!
    @IBOutlet weak var mobilePhone: UILabel!
    @IBOutlet weak var secondaryPhone: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var specialties: UILabel!
    @IBOutlet weak var experience: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- User Actions
extension ProfileContactDetailController {
    
    @IBAction func launchWeb(sender: UIButton) {
    }
    @IBAction func launchLinkedIn(sender: UIButton) {
    }
    @IBAction func launchFacebook(sender: UIButton) {
    }
    @IBAction func launchTwitter(sender: UIButton) {
    }
    @IBAction func launchInstagram(sender: UIButton) {
    }
    @IBAction func launchYoutube(sender: UIButton) {
    }
}