import UIKit

// TableViewController mapped to a TableView with static cells
// This view controller is used for both 'Prepared For' and 'Prepared By' screens
class PreparedForByController: UITableViewController, DeclareReportContent {
    // var declarations
    // reportContent will always be either 'PreparedFor' or 'PreparedBy' since it is pushed by segue with respective identifier
    var reportContent: ReportContent!
    
    // Outlets declarations
    @IBOutlet weak var preparedForByTitle: UILabel!
    @IBOutlet weak var includePreparedForBySwitch: UISwitch!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet var form: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //FIXME: shifting title slightly towards left shall be part of parent view controller
        title = reportContent.rawValue
        preparedForByTitle.text = "Include \(title!)"
        
        configureToDismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// internal utility methods
extension PreparedForByController {
    private func configureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PreparedForByController.hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        form.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyboard() {
        form.endEditing(true)
    }
}

// user actions
extension PreparedForByController {
    @IBAction func includeAction(sender: AnyObject) {
        //TODO: complete implementation
    }
    
}

// implementing textfield delegates
extension PreparedForByController: UITextFieldDelegate {
    // navigation on tap of next button
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let nextTage=textField.tag+1;
        // Try to find next responder
        let nextResponder=textField.superview?.superview?.superview?.viewWithTag(nextTage) as UIResponder!
        
        if((textField.returnKeyType == UIReturnKeyType.Next) && (nextResponder != nil)) {
            nextResponder?.becomeFirstResponder()
        }
        else if ((textField.returnKeyType == UIReturnKeyType.Done) || (nextResponder == nil))
        {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        return false // We do not want UITextField to insert line-breaks.
    }
}