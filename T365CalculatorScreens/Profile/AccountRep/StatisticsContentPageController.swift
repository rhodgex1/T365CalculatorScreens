//
//  PageViewController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/6/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//FIXME: for some reasons it is not showing the pagination views
class StatisticsContentPageController: UIViewController {

    //MARK:- Declaring constants
    static let embedSegue = "EmbedPageViewController"
    
    //MARK:- Var declarations
    var pageControllers : [UIViewController]!
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePageViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Private methods
extension StatisticsContentPageController {
    private func configurePageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        let storyboard = UIStoryboard(name: StatisticsPageContentController.storyboardName, bundle: nil)
        let firstContentPageController = storyboard.instantiateViewControllerWithIdentifier(StatisticsPageContentController.storyboardId)
        let secondContentPageController = storyboard.instantiateViewControllerWithIdentifier(StatisticsPageContentController.storyboardId)
        
        pageControllers = [firstContentPageController, secondContentPageController]
        pageViewController.setViewControllers([pageControllers[0]], direction: .Forward, animated: true, completion: nil)
        pageViewController.dataSource = self
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        
        let insertedView = pageViewController.view
        insertedView.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[insertedView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["insertedView" : insertedView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[insertedView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["insertedView" : insertedView]))
        view.layoutIfNeeded()
    }
}

//MARK:- UIPageViewControllerDataSource implementation
extension StatisticsContentPageController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = pageControllers.indexOf(viewController){
            if index == 0 {
                return nil
            }
            return pageControllers[index - 1]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = pageControllers.indexOf(viewController){
            if index == pageControllers.count - 1 {
                return nil
            }
            return pageControllers[index + 1]
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        if let pageContentControllers = pageViewController.viewControllers {
            let currentPageController = pageContentControllers[0]
            if let presentationIndex = pageControllers.indexOf(currentPageController) {
                return presentationIndex
            }
            return 0
        }
        return 0
    }
}
