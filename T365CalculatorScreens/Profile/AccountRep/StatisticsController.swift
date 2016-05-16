//
//  StatisticsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//MARK:- EmbedPageViewController Protocol
protocol EmbedPageViewController {
    var userInfoController: UserInfoController! { get }
}

class StatisticsController: UIViewController {
    //MARK:- contant declaration
    static let storyboardId = "StatisticsController"

    //MARK:- Top View IBOutlets declarations
    @IBOutlet weak var topView: UIView!

    //MARK:- Bottom View IBOutlets declarations
    @IBOutlet weak var usedTodayCount: UILabel!
    @IBOutlet weak var usedThisMonthCount: UILabel!
    @IBOutlet weak var resetFarmingCreditsButton: UIButton!
    
    //MARK:- var declarations
    var statisticsPaginationContainer: StatisticsPaginationContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier where segueIdentifier == StatisticsPaginationContainer.embedSegue {
            statisticsPaginationContainer = segue.destinationViewController as! StatisticsPaginationContainer
        }
    }

}
//MARK:- User actions
extension StatisticsController {
    
    @IBAction func resetFarmingCredits(sender: UIButton) {
    }
}