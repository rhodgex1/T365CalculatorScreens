import UIKit

typealias ManageResetButton = () -> Void

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
    
    var addResetButtonHandler  : ManageResetButton!
    var removeResetButtonHandler : ManageResetButton!
    
    
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

//MARK:- user actions
extension SellerNewNetSheetForm {
    
    @IBAction func selectionLocation(sender: AnyObject) {
    }
    
    func resetAction(sender: UIButton) {
        // reset form
        zipCodeCityState.text = ""
        salesPrice.text = ""
        totalBrokerFee.text = ""
        totalBrokerFeePercentage.text = ""
        closingDate.text = ""
        taxes.text = ""
        loanPayoffs.text = ""
        closingCosts.text = ""
        sellerCreditsToBuyer.text = ""
        financing.text = ""
        
        removeResetButtonHandler()
    }
    
}

//MARK:- private methods
extension SellerNewNetSheetForm{
    private func ifOtherTextFieldsHaveValues(currentTextField: UITextField) -> Bool{
        
        if zipCodeCityState.tag != currentTextField.tag && zipCodeCityState.text?.characters.count > 0 {
            return true
        }
        else if salesPrice.tag != currentTextField.tag && salesPrice.text?.characters.count > 0 {
            return true
        }
        else if totalBrokerFee.tag != currentTextField.tag && totalBrokerFee.text?.characters.count > 0 {
            return true
        }
        else if totalBrokerFeePercentage.tag != currentTextField.tag && totalBrokerFeePercentage.text?.characters.count > 0 {
            return true
        }
        else if closingDate.tag != currentTextField.tag && closingDate.text?.characters.count > 0 {
            return true
        }
        else if taxes.tag != currentTextField.tag && taxes.text?.characters.count > 0 {
            return true
        }
        else if loanPayoffs.tag != currentTextField.tag && loanPayoffs.text?.characters.count > 0 {
            return true
        }
        else if closingCosts.tag != currentTextField.tag && closingCosts.text?.characters.count > 0 {
            return true
        }
        else if sellerCreditsToBuyer.tag != currentTextField.tag && sellerCreditsToBuyer.text?.characters.count > 0 {
            return true
        }
        else if financing.tag != currentTextField.tag && financing.text?.characters.count > 0 {
            return true
        }
        
        return false
    }
    
    
}

//MARK:- TextField delegates
extension SellerNewNetSheetForm: UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text?.characters.count > 1 || (string.characters.count > 0 && string != ""){
            // display reset button
            addResetButtonHandler()
        }
        else {
            // remove reset button after confirming that other fields don't have values
            if ifOtherTextFieldsHaveValues(textField) {
                // have value so display reset button
                addResetButtonHandler()
            }
            else {
                // don't have values so remove reset button
                removeResetButtonHandler()
            }
        }
        
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        if ifOtherTextFieldsHaveValues(textField) {
            // have value so display reset button
            addResetButtonHandler()
        }
        else {
            removeResetButtonHandler()
        }
        return true
    }
}


