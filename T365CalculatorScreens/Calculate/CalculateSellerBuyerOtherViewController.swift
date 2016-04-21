import UIKit

enum CalculateViewContentType:String {
    case CalculateViewContentTypeData = "CalculateDataViewController"
    case CalculateViewContentTypeNoData = "CalculateEmptyViewController"
}

struct Estimate {
    var title: String
    var savedDate: String
}

class CalculateSellerBuyerOtherViewController : UIViewController {
    var theDataSource = [Estimate]()
    var theUserType : UserType!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let estimate1 = Estimate(title:"estimate 1", savedDate: "Feb 10, 2016")
//        let estimate2 = Estimate(title:"estimate 2", savedDate: "Feb 11, 2016")
//        let estimate3 = Estimate(title:"estimate 3", savedDate: "Feb 13, 2016")
//        let estimate4 = Estimate(title:"estimate 4", savedDate: "Feb 14, 2016")
//        let estimate5 = Estimate(title:"estimate 5", savedDate: "Feb 15, 2016")
//        
//        theDataSource = [estimate1, estimate2, estimate3, estimate4, estimate5]
//
//        loadViewAsPerUserType()
//    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let estimate1 = Estimate(title:"estimate 1", savedDate: "Feb 10, 2016")
        let estimate2 = Estimate(title:"estimate 2", savedDate: "Feb 11, 2016")
        let estimate3 = Estimate(title:"estimate 3", savedDate: "Feb 13, 2016")
        let estimate4 = Estimate(title:"estimate 4", savedDate: "Feb 14, 2016")
        let estimate5 = Estimate(title:"estimate 5", savedDate: "Feb 15, 2016")
        
        theDataSource = [estimate1, estimate2, estimate3, estimate4, estimate5]
        
        loadViewAsPerUserType()
    }
    
}

// MARK: Utility Methods
extension CalculateSellerBuyerOtherViewController {
    private func loadViewAsPerUserType() {
        // this extra optional binding to resolve compilation error
        if let selectedUserType = theUserType {
            switch selectedUserType {
            case .Seller:
                // theDataSource = Seller Data
                let theSellerViewController = pickViewWithCount(theDataSource.count)
                view.addSubview(theSellerViewController.view)
                
            case .Buyer:
                // theDataSource = Buyer Data
                let theBuyerViewController = pickViewWithCount(theDataSource.count)
                view.addSubview(theBuyerViewController.view)
                
            case .Other:
                // theDataSource = Other Data
                let theOtherViewController = pickViewWithCount(theDataSource.count)
                view.addSubview(theOtherViewController.view)
                
            }
        }
        
    }
    
    func pickViewWithCount(theDataSourceCount:Int) -> UIViewController {
        let theStoryboard = UIStoryboard(name: CalculateViewController.kStoryBoardSellerBuyerOther, bundle: nil)
        var theController:UIViewController!
        
        if theDataSource.count == 0 {
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