
import UIKit

class HomeContainerController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homePage:UIViewController!
        
        if (true) {
            homePage = self.storyboard?.instantiateViewControllerWithIdentifier(HomeController.storyboardIdentifier)
        } else {
            homePage = self.storyboard?.instantiateViewControllerWithIdentifier(AccountExecutiveHomeController.storyboardIdentifier)
        }
        
        self.view.addSubview(homePage.view)
        self.addChildViewController(homePage)
    }
}