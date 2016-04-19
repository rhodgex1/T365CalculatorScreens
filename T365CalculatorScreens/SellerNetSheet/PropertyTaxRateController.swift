//
//  PropertyTaxRateController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//TODO: Define data structure to populate tableview
class PropertyTaxRateController: UIViewController {
    // data array declarations
    var propertyTaxRates: [PropertyTaxRate]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Property Tax Rate"
        
        propertyTaxRates = [PropertyTaxRate]()
        //FIXME: please remove below dummy data with actual data
        let sanDiegoTaxRate = PropertyTaxRate(city: "San Diego", state: "CA", taxRate: 1.17901, isSelected: false)
        let corondoTaxRate = PropertyTaxRate(city: "Corondo", state: "CA", taxRate: 1.17901, isSelected: false)
        propertyTaxRates = [sanDiegoTaxRate, corondoTaxRate]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// Implementation of table view data source
extension PropertyTaxRateController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertyTaxRates.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TaxRateCell.cellIdentifier, forIndexPath: indexPath) as! TaxRateCell
        let aPropertyTaxRate = propertyTaxRates[indexPath.row]
        cell.populateWithData(aPropertyTaxRate)
        return cell
    }
}

// Implementation of table view delegates
extension PropertyTaxRateController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Implementing display of check - uncheck icons
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TaxRateCell
        var aPropertyTaxRate = propertyTaxRates[indexPath.row]
        aPropertyTaxRate.isSelected = !aPropertyTaxRate.isSelected
        propertyTaxRates[indexPath.row] = aPropertyTaxRate;
        cell.propertyRateSelection.selected = aPropertyTaxRate.isSelected
    }
}

struct PropertyTaxRate {
    var city: String
    var state: String
    var taxRate: Double
    var isSelected: Bool
}