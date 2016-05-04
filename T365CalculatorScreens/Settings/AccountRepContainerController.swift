import UIKit

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
        
//        let cdTimelineStoryboard = UIStoryboard(name: "AccountRep", bundle: nil)
//        let purchaseRefinanceContainerController = cdTimelineStoryboard.instantiateViewControllerWithIdentifier("AccountRepController")

        let purchaseRefinanceContainerController = UIViewController()
        purchaseRefinanceContainerController.view.backgroundColor = UIColor.whiteColor()
        
        return purchaseRefinanceContainerController
    }
    
}

// MARK: - RGPageViewController Delegate
extension AccountRepContainerController: RGPageViewControllerDelegate {
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