//
//  CDTimelineContentController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//NOTE: Since each component is added on a cell, it can be easily made hidden by setting height of corresponding cell to 0 
class CDTimelineContentController: UITableViewController {
    //MARK:- contant declaration
    static let storyboardId = "CDTimelineContentController"
    static let storyboardName = "CDTimeline"

    //MARK:- IBOutlets
    @IBOutlet weak var startClosingDateSegment: UISegmentedControl!
    @IBOutlet weak var addToCalendarButton: UIButton!
    @IBOutlet weak var federalHolidayIndicator: UIView!
    @IBOutlet weak var chooseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFederalHolidayIndicator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Private methods
extension CDTimelineContentController {
    private func showDisclaimerAlert() {
        let disclaimerAlertController = UIAlertController(title: "Disclaimer", message: "This app provides general information to real estate professional and others in determining when transaction involving an applicable loan may be consummated.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        disclaimerAlertController.addAction(okAction)
        presentViewController(disclaimerAlertController, animated: true, completion: nil)
    }
    
    private func configureFederalHolidayIndicator() {
        federalHolidayIndicator.layer.cornerRadius =  federalHolidayIndicator.frame.size.height / 2
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