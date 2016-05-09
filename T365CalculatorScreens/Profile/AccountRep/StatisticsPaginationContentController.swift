//
//  StatisticsPaginationContentController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/6/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class StatisticsPaginationContentController: UIViewController {

    //MARK:- constants
    static let storyboardId = "StatisticsPaginationContentController"
    static let storyboardName = "AccountRep"
    
    //MARK:- Declaring IBOutlets
    @IBOutlet weak var statisticsPercentage: UILabel!
    @IBOutlet weak var openedCount: UILabel!
    @IBOutlet weak var closedCount: UILabel!
    @IBOutlet weak var notIncludedCount: UILabel!
    @IBOutlet weak var daysToCloseAvgNum: UILabel!
    @IBOutlet weak var graphContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
