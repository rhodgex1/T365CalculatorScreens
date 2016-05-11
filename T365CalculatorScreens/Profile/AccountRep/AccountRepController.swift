import UIKit

class AccountRepController: UIViewController {
    //MARK:- contant declaration
    static let storyboardName = "AccountRep"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addMoreButton()
    }
}

//MARK:- Private functions
extension AccountRepController {
    //TODO: similar code is used in other class, for reusability move it to common class
    private func addMoreButton() {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "actionIcon"), forState: .Normal)
        moreButton.frame = CGRectMake(0, 0, 30, 30)
        moreButton.addTarget(self, action: #selector(AccountRepController.moreAction), forControlEvents: .TouchUpInside)
        let moreBarItem = UIBarButtonItem()
        moreBarItem.customView = moreButton
        
        self.navigationItem.rightBarButtonItem = moreBarItem
    }
}

//MARK:- User actions
extension AccountRepController {
    func moreAction() {
        let commonComponentsStoryboard = UIStoryboard(name: ActionSheetController.storyboardName, bundle: nil)
        
        let actionSheetController = commonComponentsStoryboard.instantiateViewControllerWithIdentifier(ActionSheetController.storyboardId) as! ActionSheetController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        let markAsFavActionItem = ActionSheetOption(title: "Mark as Favorite", icon: UIImage(asset: .ActionIconsStarContact),    action: { () -> Void in
            //TODO: complete implementation
            print("Mark as favorite")
        })
        let deactivateAcntActionItem = ActionSheetOption(title: "Deactivate Account", icon: UIImage(asset: .ActionIconActivateDeactivate), action: { () -> Void in
            //TODO: complete implementation
            print("Deactivate Account")
        })
        
        let cancelActionItem = ActionSheetOption(title: "Cancel", icon: UIImage(asset: .ActionCancel), action: { () -> Void in
            print("Cancel")
            // Nothing to do for now :-)
        })
        actionSheetController.actionSheetItems = [markAsFavActionItem, deactivateAcntActionItem, cancelActionItem]
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
}