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

        // Do any additional setup after loading the view.
        configureTopView()
        configureResetFarmingCreditsButton()
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

//MARK:- Private methods
extension StatisticsController {
    
    private func configureResetFarmingCreditsButton(){
        resetFarmingCreditsButton.layer.borderWidth = 1.0
        resetFarmingCreditsButton.layer.cornerRadius = 5.0
        resetFarmingCreditsButton.layer.borderColor = UIColor(red:221/255, green:221/255, blue:221/255, alpha:1).CGColor
    }
    
    private func configureTopView() {
        topView.layer.borderWidth = 1.0
        topView.layer.borderColor = UIColor(red:200/255, green:200/255, blue:200/255, alpha:1).CGColor
    }
}

//MARK:- User actions
extension StatisticsController {
    
    @IBAction func resetFarmingCredits(sender: UIButton) {
    }
}