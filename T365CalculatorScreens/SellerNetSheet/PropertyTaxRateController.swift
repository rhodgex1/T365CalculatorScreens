//
//  PropertyTaxRateController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/18/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

enum PropertyTaxRateCellTextFieldTag: Int {
    case TaxRateNameTag = 501
    case TaxRateTag = 502
}

struct PropertyTaxRate {
    var taxRateName: String
    var taxRate: Double?
    var isSelected  = false
    
    init(taxRateName: String) {
        self.taxRateName = taxRateName
    }
    
    init(taxRateName: String, taxRate: Double) {
        self.taxRateName = taxRateName
        self.taxRate = taxRate
    }
}

//TODO: Define data structure to populate tableview
class PropertyTaxRateController: UIViewController, HasHeaderContainer, DismissKeyboardOnOutsideTap {
    var backgroundView: UIView!
    
     var netProceedsController: NetProceedsController!
    
    // data array declarations
    var propertyTaxRates: [PropertyTaxRate]!
    
    @IBOutlet weak var propertyTaxRatesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundView = view
        configureToDismissKeyboard()
        
        title = "Property Tax Rate"
        
        propertyTaxRates = [PropertyTaxRate]()
        
        //FIXME: please remove below dummy data with actual data
        let sanDiegoTaxRate = PropertyTaxRate(taxRateName: "San Diego, CA", taxRate: 1.17901)
        let corondoTaxRate = PropertyTaxRate(taxRateName: "Corondo, CA", taxRate: 1.04781)
        propertyTaxRates = [sanDiegoTaxRate, corondoTaxRate]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == NetProceedsController.embedSegueIdentifier {
                netProceedsController = segue.destinationViewController as! NetProceedsController
            }
        }
    }
    
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}

//MARK:- Utility methods
extension PropertyTaxRateController{
    
    @IBAction func addFormRow(sender: AnyObject) {
        let propertyTaxRate = PropertyTaxRate(taxRateName: "")
        propertyTaxRates.append(propertyTaxRate)
        propertyTaxRatesTable.reloadData()
    }
    
    func updateSelectionForCell(aTaxRateCell: TaxRateCell) {
        if let indexPath = propertyTaxRatesTable.indexPathForCell(aTaxRateCell) {
            var aPropertyTaxRate = propertyTaxRates[indexPath.row]
            aPropertyTaxRate.isSelected = !aPropertyTaxRate.isSelected
            propertyTaxRates[indexPath.row] = aPropertyTaxRate;
            aTaxRateCell.propertyRateSelection.selected = aPropertyTaxRate.isSelected
        }
    }
}

//MARK:- Implementation of table view data source
extension PropertyTaxRateController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertyTaxRates.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TaxRateCell.cellIdentifier, forIndexPath: indexPath) as! TaxRateCell
        let aPropertyTaxRate = propertyTaxRates[indexPath.row]
        cell.populateWithData(aPropertyTaxRate)
        cell.parentViewController = self
        return cell
    }
}

//MARK:- text field delegate to populate form data structure
extension PropertyTaxRateController : UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField){
        if let aTaxRateCell = textField.superview?.superview as? TaxRateCell, indexPath = propertyTaxRatesTable.indexPathForCell(aTaxRateCell), textFieldText = textField.text  {
            let row = indexPath.row
            var aTaxRate = propertyTaxRates[row]
            
            if let aPropertyTaxRateFieldType = PropertyTaxRateCellTextFieldTag(rawValue:textField.tag) {
                switch aPropertyTaxRateFieldType {
                case .TaxRateNameTag:
                    aTaxRate.taxRateName = textFieldText
                case .TaxRateTag:
                    aTaxRate.taxRate = Double(textFieldText)
                }
            }
            
            propertyTaxRates[row] = aTaxRate
        }
    }
}

