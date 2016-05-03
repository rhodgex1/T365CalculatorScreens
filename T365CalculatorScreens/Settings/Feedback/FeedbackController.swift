//
//  FeedbackController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/3/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class FeedbackController: UIViewController {
    var feedbackFormController: FeedbackForm!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Feedback"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "EmbedContent" {
                feedbackFormController = segue.destinationViewController as! FeedbackForm
            }
        }
    }

}

//MARK:- User actions
extension FeedbackController {
    
    @IBAction func sendFeedback(sender: AnyObject) {
    }
}