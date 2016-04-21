import UIKit

enum UserType : Int {
    case Seller = 0
    case Buyer  = 1
    case Other  = 2
}

class CalculateViewController: RGPageViewController {

    // declaring variables
    var tabBarTitles: [String]!
    
    // declaring constants
    static let kStoryBoardSellerBuyerOther = "SellerBuyerOther"
    let kCalculateSellerBuyerOtherViewController = "CalculateSellerBuyerOtherViewController"
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
extension CalculateViewController : RGPageViewControllerDataSource {
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
        
        let theStoryboard = UIStoryboard(name: CalculateViewController.kStoryBoardSellerBuyerOther, bundle: nil)
        var theViewController:CalculateSellerBuyerOtherViewController! = nil
        if let userType = UserType(rawValue:index) {
            
            switch userType {
            case .Seller:
                theViewController = theStoryboard.instantiateViewControllerWithIdentifier(kCalculateSellerBuyerOtherViewController) as! CalculateSellerBuyerOtherViewController
                theViewController.theUserType = .Seller
                
            case .Buyer:
                theViewController = theStoryboard.instantiateViewControllerWithIdentifier(kCalculateSellerBuyerOtherViewController) as! CalculateSellerBuyerOtherViewController
                theViewController.theUserType = .Buyer
                
            case .Other:
                theViewController = theStoryboard.instantiateViewControllerWithIdentifier(kCalculateSellerBuyerOtherViewController) as! CalculateSellerBuyerOtherViewController
                theViewController.theUserType = .Other
                
            }
        }
        
        return theViewController
    }
    
}

// MARK: - RGPageViewController Delegate
extension CalculateViewController: RGPageViewControllerDelegate {
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
