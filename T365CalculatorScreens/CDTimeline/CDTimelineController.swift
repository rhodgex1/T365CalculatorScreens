import UIKit

//TODO: Calendar code should be added here
class CDTimelineController : UIViewController {
    
    @IBOutlet weak var theScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - User Action Methods
extension CDTimelineController {
    @IBAction func tridInforButtonAction(sender: AnyObject) {
        showDisclaimerAlert()
    }
    @IBAction func disclaimerButtonAction(sender: AnyObject) {
        showDisclaimerAlert()
    }
    
    private func showDisclaimerAlert() -> Void {
        let disclaimerAlertController = UIAlertController(title: "Disclaimer", message: "This app provides general information to real estate professional and others in determining when transaction involving an applicable loan may be consummated.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        disclaimerAlertController.addAction(okAction)
        presentViewController(disclaimerAlertController, animated: true, completion: nil)
    }
}