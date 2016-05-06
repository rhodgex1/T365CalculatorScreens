import UIKit

class CalculateDataViewController : UIViewController {
    //MARK:- contant declaration
    static let storyboardId = "CalculateDataViewController"

    @IBOutlet weak var calculateDataTableView: UITableView!

    var savedEstimates : [Estimate]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateDataTableView.tableFooterView = UIView()
    }
}

// MARK: UITableView Data Source and Delegate Methods
extension CalculateDataViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedEstimates.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(EstimateCell.cellIdentifier, forIndexPath: indexPath) as! EstimateCell
        let anEstimate = savedEstimates[indexPath.row]
        
        cell.populateWithData(anEstimate)
        changeCellMargin(cell)
        
        return cell
    }
}

// MARK: User Action Listener Methods
extension CalculateDataViewController {

    @IBAction func sortAction(sender: AnyObject) {
    }
    
}

// MARK: Utility Methods
extension CalculateDataViewController {
    func changeCellMargin(theTableCell:UITableViewCell) {
        if(theTableCell.respondsToSelector(Selector("setLayoutMargins:"))){
            theTableCell.layoutMargins = UIEdgeInsetsZero;
        }
        
        if(theTableCell.respondsToSelector(Selector("setSeparatorInset:"))){
            theTableCell.separatorInset = UIEdgeInsetsZero
        }
    }
}
