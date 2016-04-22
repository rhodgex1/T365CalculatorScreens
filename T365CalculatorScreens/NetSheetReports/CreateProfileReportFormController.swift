import UIKit

enum ReportContentSelectionButtonTag : Int {
    case PropertyDetail = 201
    case MapOfProperty = 202
    case PropertyValuationModel = 203
    case SalesComparableSummary = 204
    case SalesComparableDetailed = 205
    case SalesComparableMap = 206
    case ParcelMap = 207
}
class CreateProfileReportFormController: UITableViewController {

    var customizeReportOptionsController: CustomizeReportOptionsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

//MARK:- User actions
extension CreateProfileReportFormController {
    
    @IBAction func selectContent(sender: UIButton) {
        sender.selected = !sender.selected
        
        // perform action based on button tag
        if let reportContent = ReportContentSelectionButtonTag(rawValue:sender.tag) {
            switch reportContent {
                case .PropertyDetail:
                    // perform PropertyDetail related action
                    print("PropertyDetail selected");
                case .MapOfProperty:
                    // perform MapOfProperty related action
                    print("MapOfProperty selected");
                case .PropertyValuationModel:
                    // perform PropertyValuationModel related action
                    print("PropertyValuationModel selected");
                case .SalesComparableSummary:
                    // perform SalesComparableSummary related action
                    print("SalesComparableSummary selected");
                case .SalesComparableDetailed:
                    // perform SalesComparableDetailed related action
                    print("SalesComparableDetailed selected");
                case .SalesComparableMap:
                    // perform SalesComparableMap related action
                    print("SalesComparableMap selected");
                case .ParcelMap:
                    // perform ParcelMap related action
                    print("ParcelMap selected");
            }
        }
    }
    
}