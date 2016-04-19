import UIKit

class SellerNewNetSheetForm: UITableViewController, DismissKeyboardOnOutsideTap {
    
    var backgroundView: UIView!
    
    // declaring outlets
    @IBOutlet weak var zipCodeCityState: UITextField!
    @IBOutlet weak var salesPrice: UITextField!
    @IBOutlet weak var totalBrokerFee: UITextField!
    @IBOutlet weak var totalBrokerFeePercentage: UITextField!
    @IBOutlet weak var closingDate: UITextField!
    @IBOutlet weak var taxes: UITextField!
    @IBOutlet weak var loanPayoffs: UITextField!
    @IBOutlet weak var closingCosts: UITextField!
    @IBOutlet weak var sellerCreditsToBuyer: UITextField!
    @IBOutlet weak var financing: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuring background view to dismiss keyboard on outside tap
        backgroundView = self.tableView
        configureToDismissKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: we shall be able to avoid re-defining this method (it is already defined within protocol extension) once we get answer to this question: http://stackoverflow.com/questions/36688420/using-protocol-extension-to-dismiss-keyboard-on-outside-tap
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}

// user actions
extension SellerNewNetSheetForm {
    
    @IBAction func selectionLocation(sender: AnyObject) {
    }
}


