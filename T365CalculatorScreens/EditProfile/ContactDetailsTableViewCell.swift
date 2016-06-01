//
//  ContactDetailsTableViewCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 6/1/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class ContactDetailsTableViewCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 216.0

    var sectionTitle: UILabel!
    var mobilePhoneTitle: UILabel!
    var secondaryPhoneTitle: UILabel!
    var emailTitle: UILabel!
    var mobilePhoneValueField: UITextField!
    var secondaryPhoneValueField: UITextField!
    var emailValueField: UITextField!
    var centerView: UIView!
    
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }

    private func initViews(){
        //TODO: code to plot section is repetitive, in other classes shall be move to a common or base class
        sectionTitle = UILabel()
        sectionTitle.text = "Contact Details"
        sectionTitle.font = UIFont(name: "ProximaNova-Bold", size: 16)
        sectionTitle.textColor = UIColor(red: 67/255, green: 133/255, blue: 255/255, alpha: 1.0)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sectionTitle)
        
        // configure mobilePhoneTitle
        mobilePhoneTitle = UILabel()
        mobilePhoneTitle.text = "Mobile Phone"
        mobilePhoneTitle.font = UIFont(name: "ProximaNova-Medium", size: 14)
        mobilePhoneTitle.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        mobilePhoneTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mobilePhoneTitle)
        
        // configure mobilePhoneValueField
        mobilePhoneValueField = UITextField()
        mobilePhoneValueField.placeholder = "Enter Mobile Phone"
        mobilePhoneValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        mobilePhoneValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        mobilePhoneValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mobilePhoneValueField)
        
        // configure secondaryPhoneTitle
        secondaryPhoneTitle = UILabel()
        secondaryPhoneTitle.text = "Secondary Phone"
        secondaryPhoneTitle.font = UIFont(name: "ProximaNova-Medium", size: 14)
        secondaryPhoneTitle.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        secondaryPhoneTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(secondaryPhoneTitle)
        
        // configure secondaryPhoneValueField
        secondaryPhoneValueField = UITextField()
        secondaryPhoneValueField.placeholder = "Enter Secondary Phone"
        secondaryPhoneValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        secondaryPhoneValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        secondaryPhoneValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(secondaryPhoneValueField)
        
        // configure emailTitle
        emailTitle = UILabel()
        emailTitle.text = "Email Address"
        emailTitle.font = UIFont(name: "ProximaNova-Medium", size: 14)
        emailTitle.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        emailTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emailTitle)
        
        // configure emailValueField
        emailValueField = UITextField()
        emailValueField.placeholder = "Enter Email Address"
        emailValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        emailValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        emailValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emailValueField)
        
        // configure centerview
        centerView = UIView()
        centerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(centerView)
    }

    private func initConstraints(){
        // setting constraint on sectionTitle
        NSLayoutConstraint(item: sectionTitle, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: sectionTitle, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 25.0).active = true
        
        // adding constraints to centerView
        NSLayoutConstraint(item: centerView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 1.0).active = true
        NSLayoutConstraint(item: centerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 1.0).active = true
        NSLayoutConstraint(item: centerView, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: centerView, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on mobilePhoneTitle
        NSLayoutConstraint(item: mobilePhoneTitle, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: mobilePhoneTitle, attribute: .Top, relatedBy: .Equal, toItem: sectionTitle, attribute: .Bottom, multiplier: 1.0, constant: 12.0).active = true
        
        // setting constraint on mobilePhoneValueField
        NSLayoutConstraint(item: mobilePhoneValueField, attribute: .Left, relatedBy: .Equal, toItem: mobilePhoneTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: mobilePhoneValueField, attribute: .Top, relatedBy: .Equal, toItem: mobilePhoneTitle, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: mobilePhoneValueField, attribute: .Right, relatedBy: .Equal, toItem: centerView, attribute: .Left, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: mobilePhoneValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
        
        // setting constraint on secondaryPhoneTitle
        NSLayoutConstraint(item: secondaryPhoneTitle, attribute: .Left, relatedBy: .Equal, toItem: centerView, attribute: .Right, multiplier: 1.0, constant: 9.0).active = true
        NSLayoutConstraint(item: secondaryPhoneTitle, attribute: .Baseline, relatedBy: .Equal, toItem: mobilePhoneTitle, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on secondaryPhoneValueField
        NSLayoutConstraint(item: secondaryPhoneValueField, attribute: .Left, relatedBy: .Equal, toItem: secondaryPhoneTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: secondaryPhoneValueField, attribute: .Baseline, relatedBy: .Equal, toItem: mobilePhoneValueField, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: secondaryPhoneValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: secondaryPhoneValueField, attribute: .Height, relatedBy: .Equal, toItem: mobilePhoneValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on emailTitle
        NSLayoutConstraint(item: emailTitle, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: emailTitle, attribute: .Top, relatedBy: .Equal, toItem: mobilePhoneValueField, attribute: .Bottom, multiplier: 1.0, constant: 32.0).active = true
        
        // setting constraint on emailValueField
        NSLayoutConstraint(item: emailValueField, attribute: .Left, relatedBy: .Equal, toItem: emailTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: emailValueField, attribute: .Top, relatedBy: .Equal, toItem: emailTitle, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: emailValueField, attribute: .Right, relatedBy: .Equal, toItem: secondaryPhoneValueField, attribute: .Right, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: emailValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
    }
    
    func cellLog(){
        print("This is ContactDetailsTableViewCell! mobilePhoneValueField: \(mobilePhoneValueField.text), secondaryPhoneValueField: \(secondaryPhoneValueField.text), emailValueField: \(emailValueField.text)")
    }
}
