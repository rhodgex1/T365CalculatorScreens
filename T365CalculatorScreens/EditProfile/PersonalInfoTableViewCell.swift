//
//  PersonalInfoTableViewCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/31/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 209.0
    
    //MARK:- User components declarations
    var sectionTitle: UILabel!
    var firstNameLabel: UILabel!
    var lastNameLabel: UILabel!
    var companyLabel: UILabel!
    var titleLabel: UILabel!
    var firstNameValueField: UITextField!
    var lastNameValueField: UITextField!
    var companyValueField: UITextField!
    var titleValueField: UITextField!
    var centerView: UIView!
    
    // MARK:- Methods
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }
    
    private func initViews(){
        // configure sectionTitle
        sectionTitle = UILabel()
        sectionTitle.text = "Personal Info"
        sectionTitle.font = UIFont(name: "ProximaNova-Bold", size: 16)
        sectionTitle.textColor = UIColor(red: 67/255, green: 133/255, blue: 255/255, alpha: 1.0)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sectionTitle)
        
        // configure firstNameLabel
        firstNameLabel = UILabel()
        firstNameLabel.text = "First Name"
        firstNameLabel.font = UIFont(name: "ProximaNova-Medium", size: 14)
        firstNameLabel.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(firstNameLabel)
        
        // configure firstNameValueField
        firstNameValueField = UITextField()
        firstNameValueField.placeholder = "Enter First Name"
        firstNameValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        firstNameValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        firstNameValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(firstNameValueField)
        
        // configure lastNameLabel
        lastNameLabel = UILabel()
        lastNameLabel.text = "Last Name"
        lastNameLabel.font = UIFont(name: "ProximaNova-Medium", size: 14)
        lastNameLabel.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lastNameLabel)
        
        // configure lastNameValueField
        lastNameValueField = UITextField()
        lastNameValueField.placeholder = "Enter Last Name"
        lastNameValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        lastNameValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        lastNameValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lastNameValueField)
        
        // configure companyLabel
        companyLabel = UILabel()
        companyLabel.text = "Company"
        companyLabel.font = UIFont(name: "ProximaNova-Medium", size: 14)
        companyLabel.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(companyLabel)
        
        // configure companyValueField
        companyValueField = UITextField()
        companyValueField.placeholder = "Enter Company"
        companyValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        companyValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        companyValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(companyValueField)
        
        // configure titleLabel
        titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.font = UIFont(name: "ProximaNova-Medium", size: 14)
        titleLabel.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // configure titleValueField
        titleValueField = UITextField()
        titleValueField.placeholder = "Enter Title"
        titleValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        titleValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        titleValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleValueField)

        // configure centerview
        centerView = UIView()
        centerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(centerView)
    }
    
    private func initConstraints(){
        // adding constraints to sectionTitle
        NSLayoutConstraint(item: sectionTitle, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: sectionTitle, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 25.0).active = true
        
        // adding constraints to centerView
        NSLayoutConstraint(item: centerView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 1.0).active = true
        NSLayoutConstraint(item: centerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 1.0).active = true
        NSLayoutConstraint(item: centerView, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: centerView, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on firstNameLabel
        NSLayoutConstraint(item: firstNameLabel, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: firstNameLabel, attribute: .Top, relatedBy: .Equal, toItem: sectionTitle, attribute: .Bottom, multiplier: 1.0, constant: 12.0).active = true
        
        // setting constraint on firstNameValueField
        NSLayoutConstraint(item: firstNameValueField, attribute: .Left, relatedBy: .Equal, toItem: firstNameLabel, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: firstNameValueField, attribute: .Top, relatedBy: .Equal, toItem: firstNameLabel, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: firstNameValueField, attribute: .Right, relatedBy: .Equal, toItem: centerView, attribute: .Left, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: firstNameValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
        
        // setting constraint on lastNameLabel
        NSLayoutConstraint(item: lastNameLabel, attribute: .Left, relatedBy: .Equal, toItem: centerView, attribute: .Right, multiplier: 1.0, constant: 9.0).active = true
        NSLayoutConstraint(item: lastNameLabel, attribute: .Baseline, relatedBy: .Equal, toItem: firstNameLabel, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on lastNameValueField
        NSLayoutConstraint(item: lastNameValueField, attribute: .Left, relatedBy: .Equal, toItem: lastNameLabel, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: lastNameValueField, attribute: .Baseline, relatedBy: .Equal, toItem: firstNameValueField, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: lastNameValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: lastNameValueField, attribute: .Height, relatedBy: .Equal, toItem: firstNameValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
        
        // second half of cell
        
        // setting constraint on companyLabel
        NSLayoutConstraint(item: companyLabel, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: companyLabel, attribute: .Top, relatedBy: .Equal, toItem: firstNameValueField, attribute: .Bottom, multiplier: 1.0, constant: 32.0).active = true
        
        // setting constraint on companyValueField
        NSLayoutConstraint(item: companyValueField, attribute: .Left, relatedBy: .Equal, toItem: companyLabel, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: companyValueField, attribute: .Top, relatedBy: .Equal, toItem: companyLabel, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: companyValueField, attribute: .Right, relatedBy: .Equal, toItem: centerView, attribute: .Left, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: companyValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
        
        // setting constraint on titleLabel
        NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: centerView, attribute: .Right, multiplier: 1.0, constant: 9.0).active = true
        NSLayoutConstraint(item: titleLabel, attribute: .Baseline, relatedBy: .Equal, toItem: companyLabel, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on titleValueField
        NSLayoutConstraint(item: titleValueField, attribute: .Left, relatedBy: .Equal, toItem: titleLabel, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: titleValueField, attribute: .Baseline, relatedBy: .Equal, toItem: companyValueField, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: titleValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: titleValueField, attribute: .Height, relatedBy: .Equal, toItem: companyValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
    }
    
    func cellLog(){
        print("This is PersonalInfoTableViewCell! firstNameValueField: \(firstNameValueField.text), lastNameValueField: \(lastNameValueField.text), companyValueField: \(companyValueField.text), titleValueField: \(titleValueField.text)")
    }

}
