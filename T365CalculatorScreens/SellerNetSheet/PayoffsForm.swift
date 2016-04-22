//
//  PayoffsForm.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/19/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

struct Payoff {
    var title: String
    var amount: Double?
    
    init(title: String) {
        self.title = title
    }
    
    init(title: String, amount: Double) {
        self.title = title
        self.amount = amount
    }
}

class PayoffsForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    var payoffs : [Payoff]!
    
    @IBOutlet var payoffTableView: UITableView!
    
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
extension PayoffsForm {
    func addNewRow() {
        let payoff = Payoff(title: "Payoff \(payoffs.count + 1)")
        payoffs.append(payoff)
        payoffTableView.reloadData()
    }
    
    private func addDummyData() {
        let payoff1 = Payoff(title: "Payoff 1", amount: 250000.00)
        let payoff2 = Payoff(title: "Payoff 2", amount: 53000.00)
        payoffs = [payoff1, payoff2];
    }
}

//MARK:- TableView data source
extension PayoffsForm {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payoffs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(PayoffCell.cellIdentifier, forIndexPath: indexPath) as! PayoffCell
        let aPayoff = payoffs[indexPath.row]
        cell.populateWithData(aPayoff)
        return cell
    }
}

//MARK:- text field delegate to populate form data structure
extension PayoffsForm : UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField){
        if let payoffFormCell = textField.superview?.superview as? PayoffCell, indexPath = payoffTableView.indexPathForCell(payoffFormCell), textFieldText = textField.text  {
            let row = indexPath.row
            var aPayoff = payoffs[row]
            aPayoff.amount = Double(textFieldText)
            payoffs[row] = aPayoff
        }
    }
}