//
//  ProfileTableViewCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 6/1/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 360.0
    
    var sectionTitle: UILabel!
    var yearsOfExperienceTitle: UILabel!
    var yearsOfExperienceValueField: UITextField!
    var aboutTitle: UILabel!
    var aboutMe: UITextView!
    
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }
    
    private func initViews(){
        //TODO: code to plot section is repetitive, in other classes shall be move to a common or base class
        sectionTitle = UILabel()
        sectionTitle.text = "Profile"
        sectionTitle.font = UIFont(name: "ProximaNova-Bold", size: 16)
        sectionTitle.textColor = UIColor(red: 67/255, green: 133/255, blue: 255/255, alpha: 1.0)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sectionTitle)
        
        // configure yearsOfExperienceTitle
        yearsOfExperienceTitle = UILabel()
        yearsOfExperienceTitle.text = "Years of Experience"
        yearsOfExperienceTitle.font = UIFont(name: "ProximaNova-Medium", size: 14)
        yearsOfExperienceTitle.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        yearsOfExperienceTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(yearsOfExperienceTitle)
        
        // configure yearsOfExperienceValueField
        yearsOfExperienceValueField = UITextField()
        yearsOfExperienceValueField.placeholder = "Enter Experience"
        yearsOfExperienceValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        yearsOfExperienceValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        yearsOfExperienceValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(yearsOfExperienceValueField)
        
        // configure aboutTitle
        aboutTitle = UILabel()
        aboutTitle.text = "About"
        aboutTitle.font = UIFont(name: "ProximaNova-Medium", size: 14)
        aboutTitle.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        aboutTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aboutTitle)
        
        // configure aboutMe
        aboutMe = UITextView()
        aboutMe.font = UIFont(name: "ProximaNova-Medium", size: 17)
        aboutMe.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        aboutMe.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aboutMe)
    }
    
    private func initConstraints(){
        // setting constraint on sectionTitle
        NSLayoutConstraint(item: sectionTitle, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: sectionTitle, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 25.0).active = true
        
        // setting constraint on yearsOfExperienceTitle
        NSLayoutConstraint(item: yearsOfExperienceTitle, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: yearsOfExperienceTitle, attribute: .Top, relatedBy: .Equal, toItem: sectionTitle, attribute: .Bottom, multiplier: 1.0, constant: 12.0).active = true
        
        // setting constraint on yearsOfExperienceValueField
        NSLayoutConstraint(item: yearsOfExperienceValueField, attribute: .Left, relatedBy: .Equal, toItem: yearsOfExperienceTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: yearsOfExperienceValueField, attribute: .Top, relatedBy: .Equal, toItem: yearsOfExperienceTitle, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: yearsOfExperienceValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: yearsOfExperienceValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
        
        // setting constraint on aboutTitle
        NSLayoutConstraint(item: aboutTitle, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: aboutTitle, attribute: .Top, relatedBy: .Equal, toItem: yearsOfExperienceValueField, attribute: .Bottom, multiplier: 1.0, constant: 32.0).active = true
        
        // setting constraint on aboutMe
        NSLayoutConstraint(item: aboutMe, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: aboutMe, attribute: .Top, relatedBy: .Equal, toItem: aboutTitle, attribute: .Bottom, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: aboutMe, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -8.0).active = true
        NSLayoutConstraint(item: aboutMe, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1.0, constant: -34.0).active = true
    }

}
