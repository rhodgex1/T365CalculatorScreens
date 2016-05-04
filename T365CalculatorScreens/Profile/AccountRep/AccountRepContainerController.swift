import UIKit

enum AccountRepContentType : Int {
    case Contact = 0
    case Statistics  = 1
    case Relationships  = 2
}

class AccountRepContainerController: RGPageViewController {
    var tabBarTitles: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Christine"
        
        tabBarTitles = ["Contact", "Statistics", "Relationships"]
        
        datasource = self
        delegate = self
    }

}

// MARK: - RGPageViewController Data Source
extension AccountRepContainerController : RGPageViewControllerDataSource {
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
        let accountRepStoryboard = UIStoryboard(name: "AccountRep", bundle: nil)
        var viewController: UIViewController!
        
        if let accountRepContentType = AccountRepContentType(rawValue: index) {
            switch accountRepContentType {
            case .Contact:
                viewController = accountRepStoryboard.instantiateViewControllerWithIdentifier("ContactController")
            case .Statistics:
                viewController = accountRepStoryboard.instantiateViewControllerWithIdentifier("StatisticsController")
            case .Relationships:
                viewController = accountRepStoryboard.instantiateViewControllerWithIdentifier("RelationshipsController")
            }
        }
        
        return viewController
    }
    
}

// MARK: - RGPageViewController Delegate
extension AccountRepContainerController: RGPageViewControllerDelegate {
    func heightForTabAtIndex(index: Int) -> CGFloat {
        return 220.0
    }
    
    func widthForTabAtIndex(index: Int) -> CGFloat {
        let theTabWidth = UIScreen.mainScreen().bounds.width / 3
        return theTabWidth
    }
    
    func widthOrHeightForIndicator() -> CGFloat {
        return 2.0
    }
}