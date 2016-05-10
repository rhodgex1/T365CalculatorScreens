//
//  EditProfileController.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/9/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//MARK:- enum which provides a count of its cases
protocol CaseCountable {
    static func countCases() -> Int
    static var caseCount : Int { get }
}

//MARK:- provide a default implementation to count the cases for Int enums assuming starting at 0 and contiguous
extension CaseCountable where Self : RawRepresentable, Self.RawValue == Int {
    // count the number of cases in the enum
    static func countCases() -> Int {
        // starting at zero, verify whether the enum can be instantiated from the Int and increment until it cannot
        var count = 0
        while let _ = Self(rawValue: count) { count += 1 }
        return count
    }
}

//MARK:- Enum declarations
enum TableViewSection : Int, CaseCountable {
    case PersonalInfo = 0
    case ContactDetails = 1
    case Address = 2
    case SocialAndWeblink = 3
    case ExperienceAndSpecialties = 4
    
    static let caseCount = TableViewSection.countCases()
}

//MARK:- Struct declarations
struct PersonalInfo {
    var firstName: String
    var lastName: String
    var company: String
    var title: String
}

struct ContactDetails {
    var mobilePhone: String
    var secondaryPhone: String
    var emailAddress: String
}

struct Address {
    var type: String
    var address1: String
    var address2: String
    var city: String
    var state: String
    var zipCode: String
}

struct SocialAndWeblink {
    var name: String
    var url: String
}

struct ExperienceAndSpecialties {
    var experience: String
    var specialties: [String]
}

//MARK:- class
//FIXME:- UITextField in below rows are being hidden by Keyboard
//TODO:- implement one of these :-
// http://stackoverflow.com/questions/5265559/get-uitableview-to-scroll-to-the-selected-uitextfield-and-avoid-being-hidden-by
// http://stackoverflow.com/q/15036519/217586
class EditProfileController: UIViewController, DismissKeyboardOnOutsideTap {
    //MARK:- Outlets declarations
    @IBOutlet weak var editProfileTable: UITableView!
    
    //MARK:- var declarations
    var personalInfo : PersonalInfo!
    var contactDetails: ContactDetails!
    var addresses: [Address]!
    var socialAndWeblinks:[SocialAndWeblink]!
    var experienceAndSpecialties: ExperienceAndSpecialties!
    
    var backgroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        populateEmptyData()
        configureTableView()
                
        backgroundView = view
        configureToDismissKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- private functions
extension EditProfileController {
    func hideKeyboard() {
        backgroundView.endEditing(true)
    }
    
    private func configureTableView() {
        editProfileTable.estimatedRowHeight = 10.0
        editProfileTable.rowHeight = UITableViewAutomaticDimension
    }
    
    //TODO: pass blank value for each attribute
    private func populateEmptyData() {
        personalInfo = PersonalInfo(firstName: "", lastName: "", company: "", title: "")
        contactDetails = ContactDetails(mobilePhone: "", secondaryPhone: "", emailAddress: "")
        addresses = [Address(type:"Home", address1: "1234 Tidal Lane", address2: "", city: "Sunnyshore", state: "CA", zipCode: "94144")]
        socialAndWeblinks = [SocialAndWeblink(name: "LinkedIn", url: "www.linkedin.com/christine")]
        experienceAndSpecialties = ExperienceAndSpecialties(experience: "10", specialties:["Working with Buyers"])
    }
}

//MARK:- Implementing UITableViewDataSource methods
extension EditProfileController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsCount = 0
        
        if let tableViewSection = TableViewSection(rawValue: section) {
            switch tableViewSection{
                case .PersonalInfo:
                    rowsCount = 1
                case .ContactDetails:
                    rowsCount = 1
                case .Address:
                    // added 2 for title and add new address row
                    rowsCount = addresses.count + 2
                case .SocialAndWeblink:
                    // added 2 for title and add new weblink row
                    rowsCount = socialAndWeblinks.count + 2
                case .ExperienceAndSpecialties:
                    // added 3 for title, years of experience, and add new specialty row
                    rowsCount = experienceAndSpecialties.specialties.count + 3
            }
        }
        
        return rowsCount
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        var cell : UITableViewCell!
        
        if let tableViewSection = TableViewSection(rawValue: section) {
            switch tableViewSection{
            case .PersonalInfo:
                cell = tableView.dequeueReusableCellWithIdentifier(PersonalInfoCell.cellIdentifier, forIndexPath: indexPath)
            case .ContactDetails:
                cell = tableView.dequeueReusableCellWithIdentifier(ContactDetailsCell.cellIdentifier, forIndexPath: indexPath)
            case .Address:
                if indexPath.row == 0 {
                    // show 'Address' title
                    cell = tableView.dequeueReusableCellWithIdentifier(AddresTitleCell.cellIdentifier, forIndexPath: indexPath)
                }
                else if indexPath.row == addresses.count + 1 {
                    // show 'Add New Address' button
                    let addNewAddressCell = tableView.dequeueReusableCellWithIdentifier(AddNewAddressCell.cellIdentifier, forIndexPath: indexPath) as! AddNewAddressCell
                    
                    addNewAddressCell.addNewAddressHandler = { [weak self] in
                        guard let this = self else {
                            return
                        }
                        
                        // add new address
                        let newAddress = Address(type:"", address1: "", address2: "", city: "", state: "", zipCode: "")
                        this.addresses.append(newAddress)
                        
                        // Insert row at new indexPath
                        let newRow = this.addresses.count + 1
                        let newIndexPath = NSIndexPath(forRow: newRow, inSection: indexPath.section)
                        this.editProfileTable.beginUpdates()
                        this.editProfileTable.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .None)
                        this.editProfileTable.endUpdates()
                        
                        // scroll to newly added row
                        this.editProfileTable.scrollToRowAtIndexPath(newIndexPath, atScrollPosition: .Bottom, animated: true)
                    }
                    
                    cell = addNewAddressCell
                }
                else {
                    // show data cells
                    let addressCell = tableView.dequeueReusableCellWithIdentifier(AddressCell.cellIdentifier, forIndexPath: indexPath) as! AddressCell
                    
                    let anAddress = addresses[indexPath.row - 1]
                    addressCell.populateWithData(anAddress)
                     cell = addressCell
                }
            case .SocialAndWeblink:
                if indexPath.row == 0 {
                    // show 'Social and weblink' title
                    cell = tableView.dequeueReusableCellWithIdentifier(SocialAndWeblinkTitleCell.cellIdentifier, forIndexPath: indexPath)
                }
                else if indexPath.row == socialAndWeblinks.count + 1 {
                    // show 'Add New Link' button
                    let addNewSocialAndWeblinkCell = tableView.dequeueReusableCellWithIdentifier(AddNewSocialAndWeblinkCell.cellIdentifier, forIndexPath: indexPath) as! AddNewSocialAndWeblinkCell
                    
                    addNewSocialAndWeblinkCell.addNewSocialAndWeblinkHandler = { [weak self] in
                        guard let this = self else {
                            return
                        }
                        
                        // add new weblink
                        let newLink = SocialAndWeblink(name:"", url: "")
                        this.socialAndWeblinks.append(newLink)
                        
                        // Insert row at new indexPath
                        let newRow = this.socialAndWeblinks.count + 1
                        let newIndexPath = NSIndexPath(forRow: newRow, inSection: indexPath.section)
                        this.editProfileTable.beginUpdates()
                        this.editProfileTable.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .None)
                        this.editProfileTable.endUpdates()
                        
                        // scroll to newly added row
                        this.editProfileTable.scrollToRowAtIndexPath(newIndexPath, atScrollPosition: .Bottom, animated: true)
                    }
                    
                    cell = addNewSocialAndWeblinkCell
                }
                else {
                    // show data cells
                    let socialAndWeblinkCell = tableView.dequeueReusableCellWithIdentifier(SocialAndWeblinkCell.cellIdentifier, forIndexPath: indexPath) as! SocialAndWeblinkCell
                    
                    let aLink = socialAndWeblinks[indexPath.row - 1]
                    socialAndWeblinkCell.populateWithData(aLink)
                    cell = socialAndWeblinkCell
                }
            case .ExperienceAndSpecialties:
                if indexPath.row == 0 {
                    // show 'ExperienceAndSpecialties' title
                    cell = tableView.dequeueReusableCellWithIdentifier(ExperienceAndSpecialtiesTitleCell.cellIdentifier, forIndexPath: indexPath)
                }
                else if indexPath.row == 1 {
                    // show 'Years of experience' 
                    let yearOfExperiencecell = tableView.dequeueReusableCellWithIdentifier(YearsOfExperienceCell.cellIdentifier, forIndexPath: indexPath) as! YearsOfExperienceCell
                    yearOfExperiencecell.populateWithData(experienceAndSpecialties.experience)
                    cell = yearOfExperiencecell
                }
                else if indexPath.row == experienceAndSpecialties.specialties.count + 2 {
                    // show 'Add New Specialty' button
                    let addNewSpecialtyCell = tableView.dequeueReusableCellWithIdentifier(AddNewSpecialtyCell.cellIdentifier, forIndexPath: indexPath) as! AddNewSpecialtyCell
                    
                    addNewSpecialtyCell.addNewSpecialtyHandler = { [weak self] in
                        guard let this = self else {
                            return
                        }
                        
                        // add new specialty
                        var specialties = this.experienceAndSpecialties.specialties
                        specialties.append("")
                        this.experienceAndSpecialties.specialties = specialties
                        
                        // Insert row at new indexPath
                        let newRow = specialties.count + 2
                        let newIndexPath = NSIndexPath(forRow: newRow, inSection: indexPath.section)
                        this.editProfileTable.beginUpdates()
                        this.editProfileTable.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .None)
                        this.editProfileTable.endUpdates()
                        
                        // scroll to newly added row
                        this.editProfileTable.scrollToRowAtIndexPath(newIndexPath, atScrollPosition: .Bottom, animated: true)
                    }
                    
                    cell = addNewSpecialtyCell
                }
                else {
                    // show specialty cells
                    let specialtyCell = tableView.dequeueReusableCellWithIdentifier(SpecialtyCell.cellIdentifier, forIndexPath: indexPath) as! SpecialtyCell
                    
                    let specialties = experienceAndSpecialties.specialties
                    let aSpecialty = specialties[indexPath.row - 2]
                    specialtyCell.populateWithData(aSpecialty)
                    cell = specialtyCell
                }
            }
        }
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return TableViewSection.caseCount
    }
}