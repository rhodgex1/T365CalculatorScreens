import UIKit

typealias ActionSheetCallback = () -> Void

struct ActionSheetOption {
    var title:  String
    var icon:   String
    var action: ActionSheetCallback?
}

class ActionSheetController: UIViewController {
    
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
    
    private func configureUIElements() -> Void {
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
