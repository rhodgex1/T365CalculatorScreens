//
//  DocumentCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class DocumentCell: UITableViewCell {
    static let cellIdentifier = "DocumentCell"
    weak var parentViewController: DocumentController!
    
    //Declaring outlets
    @IBOutlet weak var documentTitle: UILabel!
    @IBOutlet weak var documentDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateWithData(document: Document) {
        documentTitle.text = document.documentName
        documentDescription.text = document.documentDescription
    }

}

//MARK:- User actions
extension DocumentCell {
    
    @IBAction func documentAction(sender: UIButton) {
        let commonComponentsStoryboard = UIStoryboard(name: ActionSheetController.storyboardName, bundle: nil)
        
        let actionSheetController = commonComponentsStoryboard.instantiateViewControllerWithIdentifier(ActionSheetController.storyboardId) as! ActionSheetController
        actionSheetController.modalPresentationStyle = .OverCurrentContext
        
        let deleteActionItem = ActionSheetOption(title: "Delete", icon: "actionIcondelete",    action: { () -> Void in
            //TODO: complete implementation
            print("Delete item")
        })
        let cancelActionItem = ActionSheetOption(title: "Cancel", icon: "actionCancel", action: { () -> Void in
            print("Cancel")
            // Nothing to do for now :-)
        })
        actionSheetController.actionSheetItems = [deleteActionItem, cancelActionItem]
        
        parentViewController.presentViewController(actionSheetController, animated: true, completion: nil)
    }
}