//
//  UserInfoController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    //MARK:- Constant declarations
    static let embedSegueIdentifier = "EmbedUserInfo"

    //MARK:- IBOutlets declarations
    @IBOutlet weak var personImage: CircularImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personDesignation: UILabel!
    @IBOutlet weak var contactButton: UIButton!
    
    //MARK:- var declarations
    var ifDisplayContactButton : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier where segueIdentifier == ContactActionsController.showSegueIdentifier {
            let contactActionsController = segue.destinationViewController
            contactActionsController.view.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        }
    }

}

