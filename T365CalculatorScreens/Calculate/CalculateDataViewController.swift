import UIKit

class CalculateDataViewController : UIViewController {

    @IBOutlet weak var calculateDataTableView: UITableView!

    var theDataSource = [Estimate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calculateDataTableView.tableFooterView = UIView()
        
        let estimate1 = Estimate(title:"estimate 1", savedDate: "Feb 10, 2016")
        let estimate2 = Estimate(title:"estimate 2", savedDate: "Feb 11, 2016")
        let estimate3 = Estimate(title:"estimate 3", savedDate: "Feb 13, 2016")
        let estimate4 = Estimate(title:"estimate 4", savedDate: "Feb 14, 2016")
        let estimate5 = Estimate(title:"estimate 5", savedDate: "Feb 15, 2016")
        
        theDataSource = [estimate1, estimate2, estimate3, estimate4, estimate5]

    }
}

// MARK: UITableView Data Source and Delegate Methods
extension CalculateDataViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(EstimateCell.cellIdentifier, forIndexPath: indexPath) as! EstimateCell
        let anEstimate = theDataSource[indexPath.row]
        
        cell.populateWithData(anEstimate)
        changeCellMargin(cell)
        
        return cell
    }
}

// MARK: User Action Listener Methods
extension CalculateDataViewController {
    @IBAction func savedEstimatesButtonAction(sender: AnyObject) {
        print("savedEstimatesButtonAction")
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
