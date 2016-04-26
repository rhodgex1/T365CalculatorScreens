import UIKit

class SellerNetSheetController: SellerNetSheetWithContainersBaseController {
    var sellerNewNetSheetFormController : SellerNewNetSheetForm!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Seller's Net Sheet"
        
        // Note: header controller (netProceedsController) is being set in its super class
        sellerNewNetSheetFormController = bodyContentController as! SellerNewNetSheetForm
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: User actions
extension SellerNetSheetController {
    
    @IBAction func moreAction(sender: AnyObject) {
    }
    
    //TODO: remove all data values shown in form
    @IBAction func resetAction(sender: AnyObject) {
    }

    
}
