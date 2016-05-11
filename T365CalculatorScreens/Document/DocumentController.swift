//
//  DocumentController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//MARK:- Struct definition
struct Document {
    var documentName: String
    var documentDescription: String
}

//MARK:- Class definition
class DocumentController: UIViewController {
    var documents = [Document]()

    @IBOutlet weak var documentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Document Images"
        documentTable.tableFooterView = UIView()
        addDummyData()  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- Private methods
extension DocumentController {
    
    private func addDummyData() {
        let dummyDoc = Document(documentName: "11672 Strayer Park Vw.", documentDescription: "Document, 1995.024")
        documents.append(dummyDoc)
    }
}

//MARK:- UITableViewDataSource methods
extension DocumentController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let documentCell = tableView.dequeueReusableCellWithIdentifier(DocumentCell.cellIdentifier, forIndexPath: indexPath) as! DocumentCell
        documentCell.parentViewController = self
        let document = documents[indexPath.row]
        documentCell.populateWithData(document)
        
        return documentCell
    }
}
