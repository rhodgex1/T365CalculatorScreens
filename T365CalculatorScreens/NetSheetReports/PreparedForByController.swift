import UIKit

// TableViewController mapped to a TableView with static cells
// This view controller is used for both 'Prepared For' and 'Prepared By' screens
class PreparedForByController: UITableViewController, DeclareReportContent, DismissKeyboardOnOutsideTap {
    // var declarations
    // reportContent will always be either 'PreparedFor' or 'PreparedBy' since it is pushed by segue with respective identifier
    var reportContent: ReportContent!
    var backgroundView: UIView!
    
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
        
        backgroundView = form
        configureToDismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
    
}


//MARK:- user actions
extension PreparedForByController {
    @IBAction func includeAction(sender: AnyObject) {
        //TODO: complete implementation
    }
    
}
