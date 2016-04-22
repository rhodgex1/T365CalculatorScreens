//
//  SellerCreditsToBuyerForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

struct MiscellaneousCredit {
    var title: String
    var amount: Double?
    
    init(title: String) {
        self.title = title
    }
}

class SellerCreditsToBuyerForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    var miscellaneousCredits: [MiscellaneousCredit]!
    
    // declaring IBOutlets
    @IBOutlet var miscellaneousTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView = view
        configureToDismissKeyboard()
        
        addDummyData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }

}

//MARK:- Utility methods
extension SellerCreditsToBuyerForm {
    private func addDummyData() {
        let miscellaneousCredit1 = MiscellaneousCredit(title: "Miscellaneous Credit")
        miscellaneousCredits = [miscellaneousCredit1];
    }
    
    func addNewRow() {
        let miscellaneousCredit = MiscellaneousCredit(title: "Miscellaneous Credit")
        miscellaneousCredits.append(miscellaneousCredit)
        miscellaneousTableView.reloadData()
    }
}

//MARK:- TableView data source
extension SellerCreditsToBuyerForm {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miscellaneousCredits.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MiscellaneousCreditCell.cellIdentifier, forIndexPath: indexPath) as! MiscellaneousCreditCell
        let aMiscellaneousCredit = miscellaneousCredits[indexPath.row]
        cell.populateWithData(aMiscellaneousCredit)
        return cell
    }
}

//MARK:- text field delegate to populate form data structure
extension SellerCreditsToBuyerForm : UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField){
        if let aMiscellaneousCreditCell = textField.superview?.superview as? MiscellaneousCreditCell, indexPath = miscellaneousTableView.indexPathForCell(aMiscellaneousCreditCell), textFieldText = textField.text  {
            let row = indexPath.row
            var aMiscellaneousCredit = miscellaneousCredits[row]
            aMiscellaneousCredit.amount = Double(textFieldText)
            miscellaneousCredits[row] = aMiscellaneousCredit
        }
    }
}


