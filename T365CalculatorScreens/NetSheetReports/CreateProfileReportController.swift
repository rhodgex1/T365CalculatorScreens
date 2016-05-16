import UIKit

class CreateProfileReportController: UIViewController {

    var createProfileReportFormController : CreateProfileReportFormController!
    
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Profile Report"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier == "EmbedContent" {
                createProfileReportFormController = segue.destinationViewController as! CreateProfileReportFormController
            }
        }
    }

}


//MARK:- User actions
extension CreateProfileReportController {
    
    @IBAction func resetAction(sender: AnyObject) {
        //TODO: complete implementation
    }

    @IBAction func previewAction(sender: AnyObject) {
        //TODO: complete implementation
        performSegueWithIdentifier("Preview", sender: self)
    }
}