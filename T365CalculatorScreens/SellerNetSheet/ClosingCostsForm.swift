//
//  ClosingCostsForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

struct ClosingCost {
    var title: String
    var value: Double?
    var segueIdentifier: String?
    
    init(title: String) {
        self.title = title
    }
    
    init(title: String, segueIdentifier: String) {
        self.title = title
        self.segueIdentifier = segueIdentifier
    }
    
    init(title: String, value: Double) {
        self.title = title
        self.value = value
    }
    
    init(title: String, value: Double, segueIdentifier: String) {
        self.title = title
        self.value = value
        self.segueIdentifier = segueIdentifier
    }
}


class ClosingCostsForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
    // Note: form data will be contained within closingCosts array
    var closingCosts: [ClosingCost]!
    
    // declaring IBOutlets
    @IBOutlet var closingCostTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView = view
        configureToDismissKeyboard()
        addFormData ()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
    
    //FIXME: Please delete this method once loaded with real time data
    private func addFormData () {
        let title = ClosingCost(title: "Title", value: 1505.00, segueIdentifier: "ShowTitle")
        let escrow = ClosingCost(title: "Escrow", segueIdentifier: "ShowEscrow")
        let recording = ClosingCost(title: "Recording", value: 93.00)
        let notary = ClosingCost(title: "Notary")
        let homeWarranty = ClosingCost(title: "Home Warranty")
        let termiteReport = ClosingCost(title: "Termite Report")
        let naturalHazardDisclosureReport = ClosingCost(title: "Natural Hazard Disclosure Report")
        let hoaTransfer = ClosingCost(title: "HOA Transfer")
        let hoaProratedDues = ClosingCost(title: "HOA Prorated Dues")
        let reconveyance = ClosingCost(title: "Reconveyance")
        let taxCertificate = ClosingCost(title: "Tax Certificate")
        let repairs = ClosingCost(title: "Repairs")
        closingCosts = [title, escrow, recording, notary, homeWarranty, termiteReport, naturalHazardDisclosureReport, hoaTransfer, hoaProratedDues, reconveyance, taxCertificate, repairs]
    }

}

// Implementing table view data source and delegates
extension ClosingCostsForm {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return closingCosts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let aClosingCost = closingCosts[indexPath.row]
        
        let cell: ClosingCostFormBaseCell
        
        if let _ = aClosingCost.segueIdentifier {
            // ClosingCostFormSegueCell
            cell = tableView.dequeueReusableCellWithIdentifier(ClosingCostFormSegueCell.cellIdentifier, forIndexPath: indexPath) as! ClosingCostFormSegueCell
        }
        else {
            // ClosingCostFormCell
            cell = tableView.dequeueReusableCellWithIdentifier(ClosingCostFormCell.cellIdentifier, forIndexPath: indexPath) as! ClosingCostFormCell
        }
        
        cell.populateWithData(aClosingCost)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let aClosingCost = closingCosts[indexPath.row]
        
        if let segueIdentifier = aClosingCost.segueIdentifier {
            performSegueWithIdentifier(segueIdentifier, sender: self)
        }
    }
}

// text field delegate to populate form data structure
extension ClosingCostsForm : UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField){
        if let closingCostFormBaseCell = textField.superview?.superview as? ClosingCostFormBaseCell, indexPath = closingCostTableView.indexPathForCell(closingCostFormBaseCell), textFieldText = textField.text  {
            let row = indexPath.row
            var aClosingCost = closingCosts[row]
            aClosingCost.value = Double(textFieldText)
            closingCosts[row] = aClosingCost
        }
    }
}
