//
//  ViewPagerBaseController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/13/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ViewPagerBaseController: RGPageViewController {
    var tabBarTitles: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datasource = self
        delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - RGPageViewController Data Source
extension ViewPagerBaseController : RGPageViewControllerDataSource {
    func numberOfPagesForViewController(pageViewController: RGPageViewController) -> Int {
        return tabBarTitles.count
    }
    
    //TODO: repetitive code shall be moved to common class - a super class?
    func tabViewForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIView {
        var tabView: UIView!
        
        // configuring tabView
        tabView = UILabel()
        (tabView as! UILabel).font = UIFont(name:"ProximaNova-Medium", size:16)
        (tabView as! UILabel).text = tabBarTitles[index]
        (tabView as! UILabel).sizeToFit()
        
        return tabView
    }
    
    func viewControllerForPageAtIndex(pageViewController: RGPageViewController, index: Int) -> UIViewController? {
        // this should be implemented in subclass
        return nil
    }
    
}

// MARK: - RGPageViewController Delegate
extension ViewPagerBaseController: RGPageViewControllerDelegate {
    func heightForTabAtIndex(index: Int) -> CGFloat {
        return 220.0
    }
    
    func widthForTabAtIndex(index: Int) -> CGFloat {
        let tabBarsCount = CGFloat(tabBarTitles.count)
        let tabWidth = UIScreen.mainScreen().bounds.width / tabBarsCount
        return tabWidth
    }
    
    func widthOrHeightForIndicator() -> CGFloat {
        return 2.0
    }
}

