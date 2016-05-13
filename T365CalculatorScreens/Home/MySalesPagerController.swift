//
//  MySalesPagerController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/12/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

enum MySalesType : Int {
    case Yesterday = 0
    case Today  = 1
    case MTD  = 2
}

class MySalesPagerController: ViewPagerBaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarTitles = ["Yesterday", "Today", "MTD"]
    }
}

// MARK: - RGPageViewController Data Source
extension MySalesPagerController {
    
    override func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        let mySalesPaginationStoryboard = UIStoryboard(name: MySalesPaginationController.storyboardName, bundle: nil)
        var viewController: UIViewController!
        
        if let accountRepContentType = MySalesType(rawValue: index) {
            switch accountRepContentType {
            case .Yesterday:
                fallthrough
            case .Today:
                fallthrough
            case .MTD:
                viewController = mySalesPaginationStoryboard.instantiateViewControllerWithIdentifier(MySalesPaginationController.storyboardId)
            }
        }
        
        return viewController
    }
    
}
