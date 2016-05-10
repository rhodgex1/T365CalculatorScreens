import UIKit

class ContactsController: UIViewController {
    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theTableView.tableFooterView = UIView()
    }
    
//    TODO: This is repetative code and this shall be moved to a common class
    private func changeCellMargin(theTableCell:UITableViewCell) {
        if(theTableCell.respondsToSelector(Selector("setLayoutMargins:"))){
            theTableCell.layoutMargins = UIEdgeInsetsZero;
        }
        
        if(theTableCell.respondsToSelector(Selector("setSeparatorInset:"))){
            theTableCell.separatorInset = UIEdgeInsetsZero
        }
    }
}

// MARK: UITableView Data Source and Delegate Methods
extension ContactsController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        FIXME: This should be dynamic
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell", forIndexPath: indexPath)
        changeCellMargin(cell)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("do nothing")
    }
}
