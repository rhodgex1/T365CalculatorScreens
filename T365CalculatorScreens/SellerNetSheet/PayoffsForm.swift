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
    var amount: Double
}

class PayoffsForm: UITableViewController, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    var payoffs : [Payoff]!
    
    @IBOutlet var payoffTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView = view
        configureToDismissKeyboard()
        
        let payoff1 = Payoff(title: "Payoff 1", amount: 250000.00)
        let payoff2 = Payoff(title: "Payoff 2", amount: 53000.00)
        payoffs = [payoff1, payoff2];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}

// TableView data source
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
