import UIKit

typealias ActionSheetCallback = () -> Void

//MARK:- Defining struct
struct ActionSheetOption {
    var title:  String
    var icon:   UIImage
    var action: ActionSheetCallback?
}

//MARK:- UIImage extension enlisting all images to be used in action sheet
//related concept explained here: https://www.natashatherobot.com/non-optional-uiimage-named-swift/
extension UIImage {
    enum Asset: String {
        case ActionCancel = "actionCancel"
        case ActionIcon = "actionIcon"
        case ActionIconActivateDeactivate = "actionIconActivateDeactivate"
        case ActionIconDelete = "actionIcondelete"
        case ActionIconEstimate = "actionIconEstimate"
        case ActionIconsDownload = "actionIconsDownload"
        case ActionIconsshare = "actionIconsshare"
        case ActionIconsStarContact = "actionIconsStarContact"
        case ActionIconsRefresh = "actionIconsRefresh"
        case ActionIconPITI = "actionIconPiti"
        case ActionIconTRID = "actionIconTRID"
        
        var image: UIImage {
            return UIImage(named: self.rawValue)!
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}

//MARK:- Defining class
class ActionSheetController: UIViewController {
    //MARK:- contant declaration
    static let storyboardId = "ActionSheetController"
    static let storyboardName = "CommonComponents"
    
    @IBOutlet weak var theActionSheetTableView: UITableView!

    var actionSheetItems : [ActionSheetOption]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIElements()
    }
}

// MARK: Private Methods
extension ActionSheetController {
    private func getYoffset() -> CGFloat {
        let numberOfRows = theActionSheetTableView.numberOfRowsInSection(0)
        let heightOfRow = theActionSheetTableView.rowHeight
        let tableHeight = Float(numberOfRows) * Float(heightOfRow)
        let yOffset = Float(UIScreen.mainScreen().bounds.size.height) - tableHeight
        return CGFloat(yOffset)
    }
    
    private func configureUIElements() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.opaque = false
        
        theActionSheetTableView.separatorColor = UIColor.clearColor()
        theActionSheetTableView.tableFooterView = UIView()
        theActionSheetTableView.contentInset = UIEdgeInsetsMake(getYoffset(), 0, 0, 0)
    }
}

// MARK: UITableView Data Source and Delegate Methods
extension ActionSheetController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionSheetItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ActionSheetCell!
        let actionSheetItem = actionSheetItems[indexPath.row]

        if actionSheetItem.title == "Cancel" {
            cell = tableView.dequeueReusableCellWithIdentifier(ActionSheetCancelCell.cellIdentifier, forIndexPath: indexPath) as! ActionSheetCancelCell
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(ActionSheetOptionCell.cellIdentifier, forIndexPath: indexPath) as! ActionSheetOptionCell
        }
        
        cell.populateWithData(actionSheetItem)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismissViewControllerAnimated(false) {
            let selectedActionItem = self.actionSheetItems[indexPath.row]
            if let menuItemAction = selectedActionItem.action {
                menuItemAction()
            }
            
        }
    }
}
