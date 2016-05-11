//
//  ProfileController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/5/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//MARK:- EmbedUserInfo protocol
protocol EmbedUserInfo {
    var userInfoController: UserInfoController! { get }
}

//MARK:- EmbedContact protocol
protocol EmbedContact {
    var profileContactDetailController: ProfileContactDetailController! { get }
}

enum ProfileType : String {
    case MyProfile = "My Profile"
    case MyAccountExecutive = "My Account Executive"
}

class ProfileController: UIViewController, EmbedUserInfo, EmbedContact{

    //MARK:- Var declarations
    var userInfoController: UserInfoController!
    var profileContactDetailController: ProfileContactDetailController!
    var profileType: ProfileType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //FIXME: remove below hardcoded profileType this shall be passed from previous view controller
        profileType = .MyAccountExecutive
        
        configureLayoutAsPerProfileType()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == UserInfoController.embedSegueIdentifier {
                userInfoController = segue.destinationViewController as! UserInfoController
            }
            else if segueIdentifier == ProfileContactDetailController.embedSegueIdentifier {
                profileContactDetailController = segue.destinationViewController as! ProfileContactDetailController
            }
            else {
                // do nothing :-)
            }
        }
    }
}

//MARK:- Private functions
extension ProfileController {
    private func configureLayoutAsPerProfileType(){
        //FIXME: Optional binding should not be needed for non-optional kinds
        // Need to use below optional binding so that ProfileType values can be compared is switch
        if let myProfileType = profileType {
            title = myProfileType.rawValue
            
            switch myProfileType {
            case .MyProfile:
                addMoreButton()
                userInfoController.contactButton.hidden = true
            case .MyAccountExecutive:
                userInfoController.contactButton.hidden = false
            }
        }
    }
    
    //TODO: similar code is used in other class, for reusability move it to common class
    private func addMoreButton() {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "actionIcon"), forState: .Normal)
        moreButton.frame = CGRectMake(0, 0, 30, 30)
        moreButton.addTarget(self, action: #selector(ProfileController.myProfileMoreAction), forControlEvents: .TouchUpInside)
        let moreBarItem = UIBarButtonItem()
        moreBarItem.customView = moreButton
        
        self.navigationItem.rightBarButtonItem = moreBarItem
    }
}

//MARK:- User actions
extension ProfileController {
    
    func myProfileMoreAction() {
        //TODO: complete the implementation
        
        let commonComponentsStoryboard = UIStoryboard(name: ActionSheetController.storyboardName, bundle: nil)
        
        let actionSheetController = commonComponentsStoryboard.instantiateViewControllerWithIdentifier(ActionSheetController.storyboardId) as! ActionSheetController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        let editProfileActionItem = ActionSheetOption(title: "Edit Profile", icon: "moreIconContacts",    action: { () -> Void in
            //TODO: complete implementation
            print("Edit Profile")
        })
        let cancelActionItem = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
            print("Cancel")
            // Nothing to do for now :-)
        })
        actionSheetController.actionSheetItems = [editProfileActionItem, cancelActionItem]
        
        self.presentViewController(actionSheetController, animated: false, completion: nil)
    }
}