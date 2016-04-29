import UIKit

class CDTimelineContainerController: RGPageViewController {

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
extension CDTimelineContainerController {
    private func addMoreButton() {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "actionIcon"), forState: .Normal)
        moreButton.frame = CGRectMake(0, 0, 30, 30)
        moreButton.addTarget(self, action: #selector(CDTimelineContainerController.moreAction), forControlEvents: .TouchUpInside)
        let moreBarItem = UIBarButtonItem()
        moreBarItem.customView = moreButton
        
        self.navigationItem.rightBarButtonItem = moreBarItem
    }
    
    func moreAction() -> Void {
        let commonComponentsStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardCommonComponents, bundle: nil)
        
        let actionSheetController = commonComponentsStoryboard.instantiateViewControllerWithIdentifier("ActionSheetController") as! ActionSheetController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        let actionItemCreate = ActionSheetOption(title: "Create New / Start Over", icon: "actionIconsRefresh",    action: { () -> Void in
            NSLog("Create New / Start Over")
        })
        let actionItemPrint = ActionSheetOption(title: "Print or Share", icon: "actionIconsshare", action: { () -> Void in
            NSLog("Print or Share")
        })
        let actionItemSave = ActionSheetOption(title: "Save", icon: "actionIconsDownload", action: { () -> Void in
            NSLog("Save")
        })
        let actionItemCancel = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
            NSLog("Cancel")
        })
        actionSheetController.actionSheetItems = [actionItemCreate, actionItemPrint, actionItemSave, actionItemCancel]
        
        self.presentViewController(actionSheetController, animated: false, completion: nil)
    }
}

// MARK: - RGPageViewController Data Source
extension CDTimelineContainerController : RGPageViewControllerDataSource {
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
        
        let cdTimelineStoryboard = UIStoryboard(name: "CDTimeline", bundle: nil)
        let purchaseRefinanceContainerController = cdTimelineStoryboard.instantiateViewControllerWithIdentifier("CDTimelineController")
        
        return purchaseRefinanceContainerController
    }
    
}

// MARK: - RGPageViewController Delegate
extension CDTimelineContainerController: RGPageViewControllerDelegate {
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