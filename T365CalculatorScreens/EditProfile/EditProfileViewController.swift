//
//  EditProfileViewController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 6/1/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    var editProfileTableViewController : EditProfileTableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(sender: UIButton) {
        for (_, editProfileCellMetaArray) in editProfileTableViewController.cellsMetaDict {
            for editProfileCellMeta in editProfileCellMetaArray {
                let cell = editProfileCellMeta.cell as! CellLogsValues
                cell.cellLog()
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier where segueIdentifier == EditProfileTableViewController.embedSegue {
            editProfileTableViewController = segue.destinationViewController as! EditProfileTableViewController
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
