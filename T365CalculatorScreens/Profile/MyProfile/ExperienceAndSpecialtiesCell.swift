//
//  ExperienceAndSpecialtiesCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/10/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit


typealias AddNewSpecialtyHandler = () -> Void

//MARK:- ExperienceAndSpecialtiesTitleCell
class ExperienceAndSpecialtiesTitleCell: UITableViewCell {
    static let cellIdentifier = "ExperienceAndSpecialtiesTitleCell"
}

//MARK:- SpecialtyCell
class SpecialtyCell: UITableViewCell {
    static let cellIdentifier = "SpecialtyCell"
    
    //MARK:- Outlets declarations

    @IBOutlet weak var specialty: UITextField!
    
    func populateWithData(specialty: String) {
        self.specialty.text = specialty
    }
}

//MARK:- YearsOfExperienceCell
class YearsOfExperienceCell: UITableViewCell {
    static let cellIdentifier = "YearsOfExperienceCell"
    
    //MARK:- Outlets declarations
    @IBOutlet weak var experience: UITextField!
    
    func populateWithData(yearOfExperience: String) {
        experience.text = yearOfExperience
    }
}


//MARK:- AddNewSpecialtyCell
class AddNewSpecialtyCell: UITableViewCell {
    static let cellIdentifier = "AddNewSpecialtyCell"
    var addNewSpecialtyHandler : AddNewSpecialtyHandler!
    
    @IBAction func addNewSpecialty(sender: UIButton) {
        addNewSpecialtyHandler()
    }
}