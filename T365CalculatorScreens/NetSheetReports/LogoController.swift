import UIKit

class LogoController: UIViewController, DeclareReportContent {
    // var declarations
    var reportContent: ReportContent!
    var logos: [String]?
    
    // constants declarations
    let positioningOffset: CGFloat = 20
    
    // Outlets declarations
    @IBOutlet weak var logoCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //FIXME: shifting title slightly towards left shall be part of parent view controller
        title = reportContent.rawValue
        
        configureFlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureFlowLayout() {
        flowLayout.sectionInset = UIEdgeInsets(top: positioningOffset, left: positioningOffset, bottom: positioningOffset, right: positioningOffset)
        flowLayout.minimumLineSpacing = positioningOffset;
        flowLayout.minimumInteritemSpacing = positioningOffset;
        
        // calculate itemsize
        // Note: in each row we need to show two items only
        
        let viewWidth = view.frame.size.width;
        let viewWidthWithoutOffsets = viewWidth - (positioningOffset * 3)
        let dimension = viewWidthWithoutOffsets / 2
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
}

// implementing collection view related data source methods
extension LogoController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let logosArray = logos {
            return logosArray.count
        }
        else {
            return 1
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let _ = logos {
            //TODO: Need to identify what kind of data shall be needed to show a logo
            let logoCell = collectionView.dequeueReusableCellWithReuseIdentifier("LogoCell", forIndexPath: indexPath)
            return logoCell
        }
        else {
            let addLogoCell = collectionView.dequeueReusableCellWithReuseIdentifier("AddLogoCell", forIndexPath: indexPath)
            return addLogoCell
        }
    }
}

// implementing collection view related delegate methods
extension LogoController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //TODO: Implement action based on user's selection
    }
}

// user actions
extension LogoController {
    
    @IBAction func includeLogoAction(sender: AnyObject) {
        // TODO: complete implemenation
    }
}
