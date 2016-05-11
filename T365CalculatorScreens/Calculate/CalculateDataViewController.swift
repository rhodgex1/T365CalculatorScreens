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
extension CalculateDataViewController: CellFullWidthSeparator {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedEstimates.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(EstimateCell.cellIdentifier, forIndexPath: indexPath) as! EstimateCell
        let anEstimate = savedEstimates[indexPath.row]
        
        cell.populateWithData(anEstimate)
        adjustCellSeparatorMargin(cell)
        
        return cell
    }
}
