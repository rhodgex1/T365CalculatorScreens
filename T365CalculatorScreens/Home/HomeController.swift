//
//  HomeController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/12/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit


class HomeController: HomeBaseController {

    static var storyboardIdentifier = "HomeController"

    //MARK:- Outlets declarations
    @IBOutlet weak var accountExecutiveName: UILabel!
    @IBOutlet weak var executiveProfile: UILabel!
    @IBOutlet weak var executiveImage: CircularImageView!
    @IBOutlet weak var numberOfPropertiesViewed: UILabel!
    
    @IBOutlet weak var collapseViewTopOffset: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kTargetIndexPath = 12
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- User actions
extension HomeController {
    
    @IBAction func howCanIImprove(sender: UIButton) {
    }
    @IBAction func viewMyProfile(sender: UIButton) {
    }
}
