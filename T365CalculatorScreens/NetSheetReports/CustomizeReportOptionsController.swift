import UIKit

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

}
