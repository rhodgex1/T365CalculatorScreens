import UIKit

class CreateNetSheetReportController: UIViewController {
    var customizeReportOptionsController: CustomizeReportOptionsController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //FIXME: shifting title slightly towards left shall be part of parent view controller
        self.title = "Create Net Sheet Report"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "EmbedContent" {
                customizeReportOptionsController = segue.destinationViewController as! CustomizeReportOptionsController
            }
        }
    }

}

// user actions
extension CreateNetSheetReportController {
    
    //TODO: complete the implementation
    @IBAction func previewAction(sender: AnyObject) {
        performSegueWithIdentifier("Preview", sender: self)
    }

}
