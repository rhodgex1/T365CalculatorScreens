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
