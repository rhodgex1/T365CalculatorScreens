import UIKit

enum AccountRepContentType : Int {
    case Contact = 0
    case Statistics  = 1
    case Relationships  = 2
}

class AccountRepContainerController: ViewPagerBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Christine"
        
        tabBarTitles = ["Contact", "Statistics", "Relationships"]
    }

}

// MARK: - RGPageViewController Data Source
extension AccountRepContainerController {
    
    override func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        let accountRepStoryboard = UIStoryboard(name: AccountRepController.storyboardName, bundle: nil)
        var viewController: UIViewController!
        
        if let accountRepContentType = AccountRepContentType(rawValue: index) {
            switch accountRepContentType {
            case .Contact:
                viewController = accountRepStoryboard.instantiateViewControllerWithIdentifier(ProfileContactDetailController.storyboardId)
            case .Statistics:
                viewController = accountRepStoryboard.instantiateViewControllerWithIdentifier(StatisticsController.storyboardId)
            case .Relationships:
                viewController = accountRepStoryboard.instantiateViewControllerWithIdentifier(RelationshipsController.storyboardId)
            }
        }
        
        return viewController
    }
    
}