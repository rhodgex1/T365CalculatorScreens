import UIKit

/* Flow/ Structure defined -
 
 SellerBuyerOtherController -> RGPageViewController
    |- SellerBuyerOtherContainerController -> UIViewController
         |- CalculateDataViewController -> UIViewController
                    OR
         |- CalculateEmptyViewController -> UIViewController
 */

enum UserType : Int {
    case Seller = 0
    case Buyer  = 1
    case Other  = 2
}

class SellerBuyerOtherController: RGPageViewController {

    // declaring variables
    var tabBarTitles: [String]!
    
    // declaring constants
    static let kStoryBoardSellerBuyerOther = "SellerBuyerOther"
    static let kStoryBoardSellerNetSheet = "SellerNetSheet"
    static let kStoryBoardCommonComponents = "CommonComponents"
    let kSellerBuyerOtherContainerController = "SellerBuyerOtherContainerController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Calculate"
        
        tabBarTitles = ["Seller", "Buyer", "Other"]
        
        datasource = self
        delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //Below reloadData statement is added to resolve the issue: on first time view load it is showing wrong y ordinate
        reloadData()
    }
}

// MARK:- User actions
extension SellerBuyerOtherController {
    
    @IBAction func addAction(sender: AnyObject) {
        
        func sellerActionSheetOptions() -> [ActionSheetOption] {
            let actionItemSellersNetSheet = ActionSheetOption(title: "Seller's Net Sheet", icon: "actionIconEstimate", action: { () -> Void in
                print("Seller's Net Sheet")
                
                let sellerBuyerOtherStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardSellerNetSheet, bundle: nil)
                let netSheetController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier("SellerNetSheetController")
                
                self.navigationController?.pushViewController(netSheetController, animated: true)

            })
            let actionItemCancel = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
                print("Cancel")
            })
            
            return [actionItemSellersNetSheet, actionItemCancel]
        }

        func buyerActionSheetOptions() -> [ActionSheetOption] {
            let actionItemBuyersEstimate = ActionSheetOption(title: "Buyer's Estimate", icon: "actionIconEstimate", action: { () -> Void in
                print("Buyer's Estimate")
            })
            let actionItemMonthlyPaymentAffordability = ActionSheetOption(title: "Monthly Payment Affordability (PITI)", icon: "", action: { () -> Void in
                print("Cancel")
            })
            let actionItemCancel = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
                print("Cancel")
            })
            
            return [actionItemBuyersEstimate, actionItemMonthlyPaymentAffordability, actionItemCancel]
        }

        func otherActionSheetOptions() -> [ActionSheetOption] {
            let actionItemFeeEstimate = ActionSheetOption(title: "Fee Estimate", icon: "actionIconEstimate",    action: { () -> Void in
                print("Fee Estimate")
            })
            let actionItemClosingDisclosureTimeline = ActionSheetOption(title: "Closing Disclosure Timeline (TRID)", icon: "", action: { () -> Void in
                print("Closing Disclosure Timeline (TRID)")
                
                let purchaseRefinanceController = CDTimelineContainerController()
                self.navigationController?.pushViewController(purchaseRefinanceController, animated: true)
            })
            let actionItemCancel = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
                print("Cancel")
            })
            
            return [actionItemFeeEstimate, actionItemClosingDisclosureTimeline, actionItemCancel]
        }

        let commonComponentsStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardCommonComponents, bundle: nil)
        
        let actionSheetController = commonComponentsStoryboard.instantiateViewControllerWithIdentifier("ActionSheetController") as! ActionSheetController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        var theActionSheetItems : [ActionSheetOption]!

        if let selectedTab = UserType(rawValue: currentTabIndex) {
            switch selectedTab {
            case .Seller:
                theActionSheetItems = sellerActionSheetOptions()
                
            case .Buyer:
                theActionSheetItems = buyerActionSheetOptions()
                
            case .Other:
                theActionSheetItems = otherActionSheetOptions()
            }
        }
        
        actionSheetController.actionSheetItems = theActionSheetItems
        self.presentViewController(actionSheetController, animated: false, completion: nil)
    }
}

// MARK: - RGPageViewController Data Source
extension SellerBuyerOtherController : RGPageViewControllerDataSource {
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
        
        let sellerBuyerOtherStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardSellerBuyerOther, bundle: nil)
        let sellerBuyerOtherContainerController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier(kSellerBuyerOtherContainerController) as! SellerBuyerOtherContainerController
        
        if let userType = UserType(rawValue:index) {
            switch userType {
                case .Seller:
                    sellerBuyerOtherContainerController.userType = .Seller
                case .Buyer:
                    sellerBuyerOtherContainerController.userType = .Buyer
                case .Other:
                    sellerBuyerOtherContainerController.userType = .Other
            }
        }
        
        return sellerBuyerOtherContainerController
    }
    
}

// MARK: - RGPageViewController Delegate
extension SellerBuyerOtherController: RGPageViewControllerDelegate {
    func heightForTabAtIndex(index: Int) -> CGFloat {
        return 164.0
    }
    
    func widthForTabAtIndex(index: Int) -> CGFloat {
        let theTabWidth = UIScreen.mainScreen().bounds.width / 3
        return theTabWidth
    }
    
    func widthOrHeightForIndicator() -> CGFloat {
        return 2.0
    }
}
