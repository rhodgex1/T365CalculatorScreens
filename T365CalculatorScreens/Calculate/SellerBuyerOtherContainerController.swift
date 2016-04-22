import UIKit

struct Estimate {
    var title: String
    var savedDate: String
}

// This ViewController will take decision that whether a view with data shall be loaded or an empty view be loaded

class SellerBuyerOtherContainerController : UIViewController {
    var userType : UserType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewControllerAsPerUserType()
    }
    
    
    private func dummyData() -> [Estimate] {
        let estimate1 = Estimate(title:"estimate 1", savedDate: "Feb 10, 2016")
        let estimate2 = Estimate(title:"estimate 2", savedDate: "Feb 11, 2016")
        let estimate3 = Estimate(title:"estimate 3", savedDate: "Feb 13, 2016")
        let estimate4 = Estimate(title:"estimate 4", savedDate: "Feb 14, 2016")
        let estimate5 = Estimate(title:"estimate 5", savedDate: "Feb 15, 2016")
        
        let savedEstimates = [estimate1, estimate2, estimate3, estimate4, estimate5]
        return savedEstimates
    }
    
}

// MARK: Utility Methods
extension SellerBuyerOtherContainerController {
    private func loadViewControllerAsPerUserType() {
        // this extra optional binding to resolve compilation error
        
        if let selectedUserType = userType {
            switch selectedUserType {
            case .Seller:
                // theDataSource = Seller Data
                let savedEstimates = dummyData()
                let sellerViewController = viewControllerForSavedEstimates(savedEstimates)
                view.addSubview(sellerViewController.view)
                addChildViewController(sellerViewController)
                
            case .Buyer:
                // theDataSource = Buyer Data
                let buyerViewController = viewControllerForSavedEstimates(nil)
                view.addSubview(buyerViewController.view)
                addChildViewController(buyerViewController)
                
            case .Other:
                // theDataSource = Other Data
                let otherViewController = viewControllerForSavedEstimates(nil)
                view.addSubview(otherViewController.view)
                addChildViewController(otherViewController)
                
            }
        }
        
    }
    
    private func viewControllerForSavedEstimates(savedEstimates :[Estimate]?) -> UIViewController {
        let sellerBuyerOtherStoryboard = UIStoryboard(name: SellerBuyerOtherController.kStoryBoardSellerBuyerOther, bundle: nil)
        let calculateViewController :UIViewController
        
        if let dataArray = savedEstimates where dataArray.count != 0 {
            let calculateDataViewController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier("CalculateDataViewController") as! CalculateDataViewController
            calculateDataViewController.savedEstimates = savedEstimates
            calculateViewController = calculateDataViewController
        } else {
            calculateViewController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier("CalculateEmptyViewController")
        }
        
        return calculateViewController
    }
}