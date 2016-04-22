import UIKit

enum CalculateViewContentType:String {
    case CalculateViewContentTypeData = "CalculateDataViewController"
    case CalculateViewContentTypeNoData = "CalculateEmptyViewController"
}

struct Estimate {
    var title: String
    var savedDate: String
}

class SellerBuyerOtherContainerController : UIViewController {
    var savedEstimates = [Estimate]()
    var userType : UserType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDummyData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func addDummyData() {
        let estimate1 = Estimate(title:"estimate 1", savedDate: "Feb 10, 2016")
        let estimate2 = Estimate(title:"estimate 2", savedDate: "Feb 11, 2016")
        let estimate3 = Estimate(title:"estimate 3", savedDate: "Feb 13, 2016")
        let estimate4 = Estimate(title:"estimate 4", savedDate: "Feb 14, 2016")
        let estimate5 = Estimate(title:"estimate 5", savedDate: "Feb 15, 2016")
        
        savedEstimates = [estimate1, estimate2, estimate3, estimate4, estimate5]
        
        loadViewAsPerUserType()
    }
    
}

// MARK: Utility Methods
extension SellerBuyerOtherContainerController {
    private func loadViewAsPerUserType() {
        // this extra optional binding to resolve compilation error
        if let selectedUserType = userType {
            switch selectedUserType {
            case .Seller:
                // theDataSource = Seller Data
                let theSellerViewController = viewControllerForCount(savedEstimates.count)
                view.addSubview(theSellerViewController.view)
                addChildViewController(theSellerViewController)
                
            case .Buyer:
                // theDataSource = Buyer Data
                let theBuyerViewController = viewControllerForCount(savedEstimates.count)
                view.addSubview(theBuyerViewController.view)
                addChildViewController(theBuyerViewController)
                
            case .Other:
                // theDataSource = Other Data
                let theOtherViewController = viewControllerForCount(savedEstimates.count)
                view.addSubview(theOtherViewController.view)
                addChildViewController(theOtherViewController)
                
            }
        }
        
    }
    
    private func viewControllerForCount(theDataSourceCount:Int) -> UIViewController {
        let theStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardSellerBuyerOther, bundle: nil)
        var theController:UIViewController!
        
        if savedEstimates.count == 0 {
            let theViewController = theStoryboard.instantiateViewControllerWithIdentifier(CalculateViewContentType.CalculateViewContentTypeNoData.rawValue)
            
            theController = theViewController
        } else {
            let theViewController = theStoryboard.instantiateViewControllerWithIdentifier(CalculateViewContentType.CalculateViewContentTypeData.rawValue) as! CalculateDataViewController
//            theViewController.theDataSource = theDataSource
            
            theController = theViewController
        }
        
        return theController
    }
}