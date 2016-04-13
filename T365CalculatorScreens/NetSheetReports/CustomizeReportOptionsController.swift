import UIKit

enum ReportContent : String {
    case PreparedFor = "Prepared For"
    case PreparedBy = "Prepared By"
    case Logo = "Logo"
}

// TableViewController mapped to a TableView with static cells
class CustomizeReportOptionsController: UITableViewController {

    @IBOutlet var optionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Removing separators from empty cells
        optionsTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue,sender: AnyObject?){
        let destinationViewController = segue.destinationViewController
        
        // combining two optional bindings into one if let statement ^_^
        if let segueIdentifier = segue.identifier, reportContent = ReportContent(rawValue: segueIdentifier) {
            // Making sure that destinationViewController declares reportContent
            // By using DeclareReportContent we have avoided few lines of codes, otherwise we have to explicity check and typecast to one of the two viewControllers to assign value to reportContent property
            if var viewControllerDeclaresReportContent = destinationViewController as? DeclareReportContent {
                 viewControllerDeclaresReportContent.reportContent = reportContent
            }
        }
    }
}

// this is a protocol which makes sure that destination view controller exposes ReportContent property
protocol DeclareReportContent {
    var reportContent: ReportContent! {get set}
}
