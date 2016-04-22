import UIKit

/* structure is:-
 
 SellerBuyerOtherController -> RGPageViewController
    |- SellerBuyerOtherContainerController -> UIViewController
 
 
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
    let kPageTitle = "Calculate"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = kPageTitle
        
        tabBarTitles = ["Seller", "Buyer", "Other"]
        
        datasource = self
        delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        tabView = UILabel()
        
        (tabView as! UILabel).font = UIFont(name:"ProximaNova-Medium", size:16)
        (tabView as! UILabel).text = tabBarTitles[index]
        (tabView as! UILabel).sizeToFit()
        
        return tabView
    }
    
    func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        
        let sellerBuyerOtherStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardSellerBuyerOther, bundle: nil)
        var sellerBuyerOtherContainerController:SellerBuyerOtherContainerController! = nil
        if let userType = UserType(rawValue:index) {
            
            switch userType {
            case .Seller:
                sellerBuyerOtherContainerController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier(kSellerBuyerOtherContainerController) as! SellerBuyerOtherContainerController
                sellerBuyerOtherContainerController.userType = .Seller
                
            case .Buyer:
                sellerBuyerOtherContainerController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier(kSellerBuyerOtherContainerController) as! SellerBuyerOtherContainerController
                sellerBuyerOtherContainerController.userType = .Buyer
                
            case .Other:
                sellerBuyerOtherContainerController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier(kSellerBuyerOtherContainerController) as! SellerBuyerOtherContainerController
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
