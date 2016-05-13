import UIKit

class DateController: UIViewController {
    //MARK:- constants declarations
    static let storyboardId = "DateController"
    static let storyboardName = "CommonComponents"
    
    @IBOutlet weak var theDatePicker: UIDatePicker!
    typealias SelectedDateCallback = (String) -> Void
    var selectedDateCallback : SelectedDateCallback!

    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.opaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DateController.handleTap(_:)))
        
        view.addGestureRecognizer(tap)
        
        theDatePicker.addTarget(self, action: #selector(DateController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        theDatePicker.minimumDate = NSDate()
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let newDate = dateFormatter.stringFromDate(theDatePicker.date)
        selectedDateCallback("\(newDate)")
    }
}