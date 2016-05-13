//
//  PaginationViewBaseController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/13/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//This class should be used as base class for PaginationControllers to avoid repetitive code
class PaginationViewBaseController: UIViewController {
    
    //MARK:- Declarations of vars
    var pageViewController: UIPageViewController!
    var paginationContentControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageControl()
        configurePageViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Private methods
extension PaginationViewBaseController {
    func configurePageViewController() {
        pageViewController.setViewControllers([paginationContentControllers[0]], direction: .Forward, animated: false, completion: nil)
        pageViewController.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
    
    //TODO: below code and its invocation shall be moved to AppDelegate
    private func configurePageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha:1.0)
        pageControl.backgroundColor = UIColor.whiteColor()
    }
}

//MARK:- UIPageViewControllerDataSource implementation
extension PaginationViewBaseController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = paginationContentControllers.indexOf(viewController){
            if index == 0 {
                return nil
            }
            return paginationContentControllers[index - 1]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = paginationContentControllers.indexOf(viewController){
            if index == paginationContentControllers.count - 1 {
                return nil
            }
            return paginationContentControllers[index + 1]
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return paginationContentControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        if let pageContentControllers = pageViewController.viewControllers {
            let currentPageController = pageContentControllers[0]
            if let presentationIndex = paginationContentControllers.indexOf(currentPageController) {
                return presentationIndex
            }
            return 0
        }
        return 0
    }
}