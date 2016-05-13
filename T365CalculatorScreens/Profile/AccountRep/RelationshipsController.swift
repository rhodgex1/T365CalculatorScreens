//
//  RelationshipsController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/4/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//MARK: TeamMember struct
struct TeamMember {
    var personName: String
    var personDesignation: String
    var personImage: UIImage?
    
    init(name: String, designation: String) {
        personName = name
        personDesignation = designation
    }
}

class RelationshipsController: UIViewController {
    //MARK:- contant declaration
    static let storyboardId = "RelationshipsController"

    var teamMembers: [TeamMember]?
    
    //MARK:- IBOutlets declarations
    @IBOutlet weak var relationshipsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addDummyData()
    }
    
    private func addDummyData() {
        let teamMember1 = TeamMember(name: "Keith Bronson", designation: "VP Orange County Sales")
        let teamMember2 = TeamMember(name: "Kethy Gould", designation: "Escrow Officer")
        let teamMember3 = TeamMember(name: "Dave Thomos", designation: "Title Officer")
        teamMembers = [teamMember1, teamMember2, teamMember3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- UITableViewDataSource methods
extension RelationshipsController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let teamMembersList = teamMembers {
            return teamMembersList.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let relationshipsCell = tableView.dequeueReusableCellWithIdentifier(RelationshipsCell.cellIdentifier, forIndexPath: indexPath) as! RelationshipsCell
        let teamMember = teamMembers![indexPath.row]
        relationshipsCell.populateWithData(teamMember)
        
        return relationshipsCell
        
    }
}

