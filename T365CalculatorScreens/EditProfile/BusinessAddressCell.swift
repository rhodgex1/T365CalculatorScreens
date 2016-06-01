//
//  BusinessAddressCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 6/1/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

class BusinessAddressCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 290.0

    //MARK:- User components declarations
    var sectionTitle: UILabel!
    var address1: UILabel!
    var address1ValueField: UITextField!
    var address2: UILabel!
    var address2ValueField: UITextField!
    var city: UILabel!
    var cityValueField: UITextField!
    var zip: UILabel!
    var zipValueField: UITextField!
    var state: UILabel!
    var stateValueField: UITextField!

    // MARK:- Methods
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }
    
    private func initViews(){
        // configure sectionTitle
        sectionTitle = UILabel()
        sectionTitle.text = "Business Address"
        sectionTitle.font = UIFont(name: "ProximaNova-Bold", size: 16)
        sectionTitle.textColor = UIColor(red: 67/255, green: 133/255, blue: 255/255, alpha: 1.0)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sectionTitle)
        
        // configure address1
        address1 = UILabel()
        address1.text = "Address 1"
        address1.font = UIFont(name: "ProximaNova-Medium", size: 14)
        address1.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        address1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(address1)
        
        // configure address1ValueField
        address1ValueField = UITextField()
        address1ValueField.placeholder = "Enter Address 1"
        address1ValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        address1ValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        address1ValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(address1ValueField)
        
        // configure address2
        address2 = UILabel()
        address2.text = "Address 2"
        address2.font = UIFont(name: "ProximaNova-Medium", size: 14)
        address2.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        address2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(address2)
        
        // configure address2ValueField
        address2ValueField = UITextField()
        address2ValueField.placeholder = "Enter Address 2"
        address2ValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        address2ValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        address2ValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(address2ValueField)
        
        // configure zip
        zip = UILabel()
        zip.text = "Zip"
        zip.font = UIFont(name: "ProximaNova-Medium", size: 14)
        zip.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        zip.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(zip)
        
        // configure zipValueField
        zipValueField = UITextField()
        zipValueField.placeholder = "Enter Zip"
        zipValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        zipValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        zipValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(zipValueField)
        
        // configure city
        city = UILabel()
        city.text = "City"
        city.font = UIFont(name: "ProximaNova-Medium", size: 14)
        city.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        city.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(city)
        
        // configure cityValueField
        cityValueField = UITextField()
        cityValueField.placeholder = "Enter City"
        cityValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        cityValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        cityValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cityValueField)
        
        // configure state
        state = UILabel()
        state.text = "State"
        state.font = UIFont(name: "ProximaNova-Medium", size: 14)
        state.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        state.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(state)
        
        // configure stateValueField
        stateValueField = UITextField()
        stateValueField.placeholder = "State"
        stateValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        stateValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        stateValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stateValueField)
    }
    
    private func initConstraints(){
        // adding constraints to sectionTitle
        NSLayoutConstraint(item: sectionTitle, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: sectionTitle, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 25.0).active = true
        
        // setting constraint on address1
        NSLayoutConstraint(item: address1, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: address1, attribute: .Top, relatedBy: .Equal, toItem: sectionTitle, attribute: .Bottom, multiplier: 1.0, constant: 12.0).active = true
        
        // setting constraint on address1ValueField
        NSLayoutConstraint(item: address1ValueField, attribute: .Left, relatedBy: .Equal, toItem: address1, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: address1ValueField, attribute: .Top, relatedBy: .Equal, toItem: address1, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: address1ValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: address1ValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
        
        // setting constraint on address2
        NSLayoutConstraint(item: address2, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: address2, attribute: .Top, relatedBy: .Equal, toItem: address1ValueField, attribute: .Bottom, multiplier: 1.0, constant: 32.0).active = true
        
        // setting constraint on address2ValueField
        NSLayoutConstraint(item: address2ValueField, attribute: .Left, relatedBy: .Equal, toItem: address2, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: address2ValueField, attribute: .Top, relatedBy: .Equal, toItem: address2, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: address2ValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: address2ValueField, attribute: .Height, relatedBy: .Equal, toItem: address1ValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on zip
        NSLayoutConstraint(item: zip, attribute: .Left, relatedBy: .Equal, toItem: zipValueField, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: zip, attribute: .Baseline, relatedBy: .Equal, toItem: city, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on zipValueField
        NSLayoutConstraint(item: zipValueField, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: zipValueField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 70.0).active = true
        NSLayoutConstraint(item: zipValueField, attribute: .Baseline, relatedBy: .Equal, toItem: cityValueField, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: zipValueField, attribute: .Height, relatedBy: .Equal, toItem: address1ValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on state
        NSLayoutConstraint(item: state, attribute: .Left, relatedBy: .Equal, toItem: stateValueField, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: state, attribute: .Baseline, relatedBy: .Equal, toItem: city, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on stateValueField
        NSLayoutConstraint(item: stateValueField, attribute: .Right, relatedBy: .Equal, toItem: zipValueField, attribute: .Left, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: stateValueField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0).active = true
        NSLayoutConstraint(item: stateValueField, attribute: .Baseline, relatedBy: .Equal, toItem: cityValueField, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: stateValueField, attribute: .Height, relatedBy: .Equal, toItem: address1ValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on city
        NSLayoutConstraint(item: city, attribute: .Left, relatedBy: .Equal, toItem: sectionTitle, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: city, attribute: .Top, relatedBy: .Equal, toItem: address2ValueField, attribute: .Bottom, multiplier: 1.0, constant: 32.0).active = true
        
        // setting constraint on cityValueField
        NSLayoutConstraint(item: cityValueField, attribute: .Left, relatedBy: .Equal, toItem: city, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: cityValueField, attribute: .Top, relatedBy: .Equal, toItem: city, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: cityValueField, attribute: .Right, relatedBy: .Equal, toItem: stateValueField, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: cityValueField, attribute: .Height, relatedBy: .Equal, toItem: address1ValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
    }
}
