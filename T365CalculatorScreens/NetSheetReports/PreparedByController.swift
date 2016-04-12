import UIKit

// TableViewController mapped to a TableView with static cells
class PreparedByController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //FIXME: shifting title slightly towards left shall be part of parent view controller
        self.title = "Prepared By"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
