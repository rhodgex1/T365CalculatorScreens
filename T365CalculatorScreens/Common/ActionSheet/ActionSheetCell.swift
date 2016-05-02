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
        let iconImage = UIImage(named:actionSheetOption.icon)
        
        actionTitle.text = actionSheetOption.title
        
        if iconImage != nil {
            actionIcon.image = UIImage(named:actionSheetOption.icon)!
        }
    }
}