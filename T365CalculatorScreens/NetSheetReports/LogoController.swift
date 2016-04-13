import UIKit

class LogoController: UIViewController, DeclareReportContent {
    // var declarations
    var reportContent: ReportContent!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //FIXME: shifting title slightly towards left shall be part of parent view controller
        title = reportContent.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
