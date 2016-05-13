//
//  HomeBaseController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/12/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit
import MapKit

// This is the base class for HomeController, AccountExecutiveHomeController
class HomeBaseController: UITableViewController {

    //MARK:- Binding outlets
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var medianDataDate: UILabel!
    @IBOutlet weak var estimatedValue: UILabel!
    @IBOutlet weak var salesPrice: UILabel!
    @IBOutlet weak var percentChange: UILabel!
    @IBOutlet weak var profitLossImage: UIImageView!
    @IBOutlet weak var daysOnMarket: UILabel!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var enterNewZipCodeView: UIView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var medianHomeValue: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterNewZipCodeView.hidden = true
        title = "Home"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- User actions
extension HomeBaseController {
    @IBAction func disclaimer(sender: UIButton) {
    }
    
    @IBAction func changeLocation(sender: UIButton) {
        enterNewZipCodeView.hidden = false
    }
    @IBAction func cancelLocation(sender: UIButton) {
        enterNewZipCodeView.hidden = true
    }
    @IBAction func saveLocation(sender: UIButton) {
        enterNewZipCodeView.hidden = true
    }
}