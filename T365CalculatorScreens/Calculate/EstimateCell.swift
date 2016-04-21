import UIKit

class EstimateCell: UITableViewCell {
    static let cellIdentifier = "sellerSavedTableCell"
    
    @IBOutlet weak var estimateTitle: UILabel!
    @IBOutlet weak var estimateDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func populateWithData(estimate: Estimate) {
        estimateTitle.text = estimate.title
        estimateDate.text = estimate.savedDate
    }
}
