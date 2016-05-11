//
//  MoreController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class MoreController: UIViewController {
    //MARK:- Declaring outlets
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personDesignation: UILabel!
    @IBOutlet weak var personImage: CircularImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //TODO: set appropriate user image
        addRightUserBarButton(UIImage(named: "actionIconActivateDeactivate")!)
        
        title = "More"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Declaring user actions
extension MoreController {
    func rightUserBarButtonAction() {
        
    }
    
    @IBAction func logout(sender: UIButton) {
    }
}

//MARK:- Declaring private methods
extension MoreController {
    private func addRightUserBarButton(userImage: UIImage) {
        let moreButton = UIButton()
        
        moreButton.setImage(userImage, forState: .Normal)
        moreButton.frame = CGRectMake(0, 0, 30, 30)
        moreButton.layer.cornerRadius = moreButton.frame.size.width / 2
        moreButton.addTarget(self, action: #selector(MoreController.rightUserBarButtonAction), forControlEvents: .TouchUpInside)
        let moreBarItem = UIBarButtonItem()
        moreBarItem.customView = moreButton
        
        self.navigationItem.rightBarButtonItem = moreBarItem
    }
}