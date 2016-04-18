import UIKit

class SellerNewNetSheetForm: UITableViewController, DismissKeyboardOnOutsideTap {
    
    var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuring background view to dismiss keyboard on outside tap
        backgroundView = self.tableView
        configureToDismissKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: we shall be able to avoid re-defining this method (it is already defined withing protocol extension) once we get answer to this question: http://stackoverflow.com/questions/36688420/using-protocol-extension-to-dismiss-keyboard-on-outside-tap
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
}

extension SellerNewNetSheetForm {
    
    @IBAction func selectionLocation(sender: AnyObject) {
    }
}


