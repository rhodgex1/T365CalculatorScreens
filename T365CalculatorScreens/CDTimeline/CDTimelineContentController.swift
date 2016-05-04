//
//  CDTimelineContentController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class CDTimelineContentController: UITableViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var startClosingDateSegment: UISegmentedControl!
    @IBOutlet weak var addToCalendarButton: UIButton!
    @IBOutlet weak var federalHolidayIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFederalHolidayIndicator()
        configureAddToCalendarButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Private methods
extension CDTimelineContentController {
    private func showDisclaimerAlert() -> Void {
        let disclaimerAlertController = UIAlertController(title: "Disclaimer", message: "This app provides general information to real estate professional and others in determining when transaction involving an applicable loan may be consummated.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        disclaimerAlertController.addAction(okAction)
        presentViewController(disclaimerAlertController, animated: true, completion: nil)
    }
    
    private func configureFederalHolidayIndicator() {
        federalHolidayIndicator.layer.cornerRadius =  federalHolidayIndicator.frame.size.height / 2
    }
    
    private func configureAddToCalendarButton() {
        addToCalendarButton.layer.borderWidth = 2
        addToCalendarButton.layer.cornerRadius = 5
        addToCalendarButton.layer.borderColor = UIColor(red: 230, green: 230, blue: 230, alpha:1).CGColor
    }
}

//MARK:- User actions
extension CDTimelineContentController {
    @IBAction func excludeSatAction(sender: UISwitch) {
    }
    
    @IBAction func addToCalendar(sender: UIButton) {
    }
    @IBAction func startClosingDateAction(sender: UISegmentedControl) {
    }
    @IBAction func disclaimerAction(sender: UIButton) {
        showDisclaimerAlert()
    }
    @IBAction func tridInfoAction(sender: UIButton) {
        showDisclaimerAlert()
    }
}