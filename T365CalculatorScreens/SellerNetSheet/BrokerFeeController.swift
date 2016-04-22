import UIKit

class BrokerFeeController: SellerNetSheetWithContainersBaseController {
    var brokerFeeFormController : BrokerFeeForm!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Broker Fee"
        
        // Note: header controller (netProceedsController) is being set in its super class
        brokerFeeFormController = bodyContentController as! BrokerFeeForm
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
