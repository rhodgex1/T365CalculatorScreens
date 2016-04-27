import UIKit

class SellerNetSheetController: SellerNetSheetWithContainersBaseController {
    var sellerNewNetSheetFormController : SellerNewNetSheetForm!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Seller's Net Sheet"
        
        // Note: header controller (netProceedsController) is being set in its super class
        sellerNewNetSheetFormController = bodyContentController as! SellerNewNetSheetForm
        sellerNewNetSheetFormController.addResetButtonHandler = { [weak self] in
            guard let this = self else {
                return
            }
           this.addResetBarButtonItem()
        }
        sellerNewNetSheetFormController.removeResetButtonHandler = { [weak self] in
            guard let this = self else {
                return
            }
            this.removeResetBarButtonItem()
        }
        
        displayRightBarButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SellerNetSheetController {
    private func addResetBarButtonItem() {
        if navigationItem.rightBarButtonItems?.count == 1 {
            navigationItem.rightBarButtonItems?.insert(resetBarButtonItem(), atIndex: 1)
        }
    }
    
    private func removeResetBarButtonItem() {
        if navigationItem.rightBarButtonItems?.count == 2 {
            navigationItem.rightBarButtonItems?.removeLast()
        }
    }
    
    private func displayRightBarButtonItem() {
        navigationItem.rightBarButtonItems = [addMoreBarButtonItem()]
    }
    
    private func addMoreBarButtonItem() -> UIBarButtonItem {
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "actionIcon"), forState: .Normal)
        moreButton.frame = CGRectMake(0, 0, 30, 30)
        moreButton.addTarget(self, action: #selector(SellerNetSheetController.moreAction(_:)), forControlEvents: .TouchUpInside)
        let moreBarItem = UIBarButtonItem()
        moreBarItem.customView = moreButton
        
        return moreBarItem
    }
    
    private func resetBarButtonItem() -> UIBarButtonItem{
        let resetButton = UIButton()
        resetButton.setImage(UIImage(named: "resetIcon"), forState: .Normal)
        resetButton.frame = CGRectMake(0, 0, 30, 30)
        resetButton.addTarget(sellerNewNetSheetFormController, action: #selector(SellerNewNetSheetForm.resetAction(_:)), forControlEvents: .TouchUpInside)
        let resetBarItem = UIBarButtonItem()
        resetBarItem.customView = resetButton
        
        return resetBarItem
    }
    
   
    func moreAction(sender: UIButton) {
        // more action
        
        let sellerBuyerOtherStoryboard = UIStoryboard(name: "SellerNetSheet", bundle: nil)

        let actionSheetController = sellerBuyerOtherStoryboard.instantiateViewControllerWithIdentifier("ActionSheetViewController") as! ActionSheetViewController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        let actionItemCreate = ActionSheetOption(title: "Create New / Start Over", icon: "actionIconsRefresh",    action: { () -> Void in
            NSLog("Create New / Start Over")
        })
        let actionItemPrint = ActionSheetOption(title: "Print or Share", icon: "actionIconsshare", action: { () -> Void in
            NSLog("Print or Share")
        })
        let actionItemSave = ActionSheetOption(title: "Save", icon: "actionIconsDownload", action: { () -> Void in
            NSLog("Save")
        })
        let actionItemCancel = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
            NSLog("Cancel")
        })
        actionSheetController.actionSheetItems = [actionItemCreate, actionItemPrint, actionItemSave, actionItemCancel]
        
        self.presentViewController(actionSheetController, animated: false, completion: nil)

    }
}

//MARK: User actions
extension SellerNetSheetController {
 
    
}
