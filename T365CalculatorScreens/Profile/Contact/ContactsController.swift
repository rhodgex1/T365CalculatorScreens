import UIKit

class ContactsController: UIViewController {
    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theTableView.tableFooterView = UIView()
    }
}

// MARK: UITableView Data Source and Delegate Methods
extension ContactsController: CellFullWidthSeparator {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        FIXME: This should be dynamic
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell", forIndexPath: indexPath)
        adjustCellSeparatorMargin(cell)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("do nothing")
    }
}
