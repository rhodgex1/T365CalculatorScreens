import UIKit

class CDTimelineController: RGPageViewController {

    // declaring variables
    var tabBarTitles: [String]!

    @IBOutlet weak var theScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMoreButton()
        title = "CD Timeline (TRID)"
        
        tabBarTitles = ["Purchase", "Refinance"]
        
        datasource = self
        delegate = self

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
        
        let actionItemCreate = ActionSheetOption(title: "Create New / Start Over", icon: "actionIconsRefresh",    action: { () -> Void in
            print("Create New / Start Over")
        })
        let actionItemPrint = ActionSheetOption(title: "Print or Share", icon: "actionIconsshare", action: { () -> Void in
            print("Print or Share")
        })
        let actionItemSave = ActionSheetOption(title: "Save", icon: "actionIconsDownload", action: { () -> Void in
            print("Save")
        })
        let actionItemCancel = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
            print("Cancel")
        })
        actionSheetController.actionSheetItems = [actionItemCreate, actionItemPrint, actionItemSave, actionItemCancel]
        
        self.presentViewController(actionSheetController, animated: false, completion: nil)
    }
}

// MARK: - RGPageViewController Data Source
extension CDTimelineController : RGPageViewControllerDataSource {
    func numberOfPagesForViewController(pageViewController: RGPageViewController) -> Int {
        return tabBarTitles.count
    }
    
    func tabViewForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIView {
        var tabView: UIView!
        
        // configuring tabView
        tabView = UILabel()
        (tabView as! UILabel).font = UIFont(name:"ProximaNova-Medium", size:16)
        (tabView as! UILabel).text = tabBarTitles[index]
        (tabView as! UILabel).sizeToFit()
        
        return tabView
    }
    
    func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        
        let cdTimelineStoryboard = UIStoryboard(name: CDTimelineContentController.storyboardName, bundle: nil)
        let purchaseRefinanceContainerController = cdTimelineStoryboard.instantiateViewControllerWithIdentifier(CDTimelineContentController.storyboardId)
        
        return purchaseRefinanceContainerController
    }
    
}

// MARK: - RGPageViewController Delegate
extension CDTimelineController: RGPageViewControllerDelegate {
    func heightForTabAtIndex(index: Int) -> CGFloat {
        return 164.0
    }
    
    func widthForTabAtIndex(index: Int) -> CGFloat {
        let theTabWidth = UIScreen.mainScreen().bounds.width / 2
        return theTabWidth
    }
    
    func widthOrHeightForIndicator() -> CGFloat {
        return 2.0
    }
}