//
//  MySalesPaginationController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/13/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class MySalesPaginationController: PaginationViewBaseController {

    //MARK:- constants
    static let storyboardId = "MySalesPaginationController"
    static let storyboardName = "Home"
    
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
extension MySalesPaginationController {
    override func configurePageViewController() {
        let storyboard = UIStoryboard(name: MySalesController.storyboardName, bundle: nil)
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.dataSource = self
        
        let firstPaginationContentController = storyboard.instantiateViewControllerWithIdentifier(MySalesController.storyboardId) as! MySalesController
        let secondPaginationContentController = storyboard.instantiateViewControllerWithIdentifier(MySalesController.storyboardId) as! MySalesController
        
        paginationContentControllers = [firstPaginationContentController, secondPaginationContentController]
        
        super.configurePageViewController()
    }
}
