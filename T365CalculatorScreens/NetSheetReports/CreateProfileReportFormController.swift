import UIKit

class CreateProfileReportFormController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// User actions
extension CreateProfileReportFormController {
    
    @IBAction func selectContent(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
}