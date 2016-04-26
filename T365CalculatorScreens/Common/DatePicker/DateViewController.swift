import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var theDatePicker: UIDatePicker!
    typealias SelectedDateCallback = (String) -> Void
    var selectedDateCallback : SelectedDateCallback!

    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.opaque = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DateViewController.handleTap(_:)))
        
        view.addGestureRecognizer(tap)
        
        theDatePicker.addTarget(self, action: #selector(DateViewController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .FullStyle
        let newDate = dateFormatter.stringFromDate(theDatePicker.date)
        selectedDateCallback("\(newDate)")
    }
}