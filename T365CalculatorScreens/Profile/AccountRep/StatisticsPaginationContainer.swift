//
//  StatisticsPaginationContainer.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/9/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class StatisticsPaginationContainer: PaginationViewBaseController {
    
    //MARK:- Declaring constants
    static let embedSegue = "EmbedStatisticsPaginationContainer"
    static let storyboardName = "AccountRep"
    static let storyboardId = "StatisticsPaginationContainer"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Private methods
extension StatisticsPaginationContainer {
    
    override func configurePageViewController() {
        let storyboard = UIStoryboard(name: StatisticsPaginationContentController.storyboardName, bundle: nil)
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.dataSource = self
        
        let firstPaginationContentController = storyboard.instantiateViewControllerWithIdentifier(StatisticsPaginationContentController.storyboardId) as! StatisticsPaginationContentController
        
        let secondPaginationContentController = storyboard.instantiateViewControllerWithIdentifier(StatisticsPaginationContentController.storyboardId) as! StatisticsPaginationContentController
        
        paginationContentControllers = [firstPaginationContentController, secondPaginationContentController]
        
        super.configurePageViewController()
    }
}