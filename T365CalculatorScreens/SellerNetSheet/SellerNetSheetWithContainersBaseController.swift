//
//  SellerNetSheetBaseController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 4/20/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

enum ContainerSegueIdentifier : String {
    case EmbedHeader = "EmbedNetProceeds"
    case EmbedBody = "EmbedBody"
}

class SellerNetSheetWithContainersBaseController: UIViewController, HasHeaderContainer,  HasBodyContainer{
    // declaring header and body content controllers
    // both of these can now be used to access respective outlets in parent view controller
    var netProceedsController: NetProceedsController!
    var bodyContentController: UITableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier, containerSegueIdentifier = ContainerSegueIdentifier(rawValue: segueIdentifier) {
            switch  containerSegueIdentifier {
                case .EmbedHeader:
                    netProceedsController = segue.destinationViewController as! NetProceedsController
                case .EmbedBody:
                    bodyContentController = segue.destinationViewController as! UITableViewController
            }
        }
    }

}

protocol HasHeaderContainer {
    var netProceedsController: NetProceedsController! { get }
}

protocol HasBodyContainer {
    var bodyContentController: UITableViewController! { get }
}
