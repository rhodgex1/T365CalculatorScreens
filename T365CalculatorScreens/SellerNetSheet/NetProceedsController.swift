import UIKit

class NetProceedsController: UIViewController {
    static let embedSegueIdentifier = "EmbedNetProceeds"

    @IBOutlet weak var netProceedsAmount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- user actions
extension NetProceedsController {
    
    @IBAction func infoAction(sender: AnyObject) {
        //FIXME: Add correct title and message
        let disclaimerAlertController = UIAlertController(title: "Disclaimer", message: "This app provides general information to real estate professional and others in determining when transaction involving an applicable loan may be consummated.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        disclaimerAlertController.addAction(okAction)
        presentViewController(disclaimerAlertController, animated: true, completion: nil)
    }
}
