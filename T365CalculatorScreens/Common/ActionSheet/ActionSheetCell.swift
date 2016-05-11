import UIKit

class ActionSheetCell: UITableViewCell {
    
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var actionIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func populateWithData(actionSheetOption: ActionSheetOption) {
        actionTitle.text = actionSheetOption.title
        actionIcon.image = actionSheetOption.icon
    }
}