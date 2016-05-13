import UIKit

class CDTimelineController: ViewPagerBaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMoreButton()
        title = "CD Timeline (TRID)"
        
        tabBarTitles = ["Purchase", "Refinance"]

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //Below reloadData statement is added to resolve the issue: on first time view load it is showing wrong y ordinate
        reloadData()
    }

}

// MARK: - Private Methods
extension CDTimelineController {
    //TODO: similar code is used in other class, for reusability move it to common class
    private func addMoreButton() {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "actionIcon"), forState: .Normal)
        moreButton.frame = CGRectMake(0, 0, 30, 30)
        moreButton.addTarget(self, action: #selector(CDTimelineController.moreAction), forControlEvents: .TouchUpInside)
        let moreBarItem = UIBarButtonItem()
        moreBarItem.customView = moreButton
        
        self.navigationItem.rightBarButtonItem = moreBarItem
    }
}

// MARK:- User actions
extension CDTimelineController {
    func moreAction() {
        let commonComponentsStoryboard = UIStoryboard(name: ActionSheetController.storyboardName, bundle: nil)
        
        let actionSheetController = commonComponentsStoryboard.instantiateViewControllerWithIdentifier(ActionSheetController.storyboardId) as! ActionSheetController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        let actionItemCreate = ActionSheetOption(title: "Create New / Start Over", icon: UIImage(asset: .ActionIconsRefresh),    action: { () -> Void in
            print("Create New / Start Over")
        })
        let actionItemPrint = ActionSheetOption(title: "Print or Share", icon: UIImage(asset: .ActionIconsshare), action: { () -> Void in
            print("Print or Share")
        })
        let actionItemSave = ActionSheetOption(title: "Save", icon: UIImage(asset: .ActionIconsDownload), action: { () -> Void in
            print("Save")
        })
        let actionItemCancel = ActionSheetOption(title: "Cancel", icon: UIImage(asset: .ActionCancel), action: { () -> Void in
            print("Cancel")
        })
        actionSheetController.actionSheetItems = [actionItemCreate, actionItemPrint, actionItemSave, actionItemCancel]
        
        self.presentViewController(actionSheetController, animated: false, completion: nil)
    }
}

// MARK: - RGPageViewController Data Source
extension CDTimelineController {
    override func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        
        let cdTimelineStoryboard = UIStoryboard(name: CDTimelineContentController.storyboardName, bundle: nil)
        let purchaseRefinanceContainerController = cdTimelineStoryboard.instantiateViewControllerWithIdentifier(CDTimelineContentController.storyboardId)
        
        return purchaseRefinanceContainerController
    }
    
}

// MARK: - RGPageViewController Delegate
extension CDTimelineController {
    override func heightForTabAtIndex(index: Int) -> CGFloat {
        return 164.0
    }
}