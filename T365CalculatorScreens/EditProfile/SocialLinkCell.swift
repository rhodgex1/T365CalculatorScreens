//
//  SocialLinkCell.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/31/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

typealias DeleteSocialAndWeblink = () -> Void
typealias AddSocialAndWeblink = () -> Void

class SocialLinkTitleCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 59.0
    
    var sectionTitle: UILabel!
    
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }
    
    private func initViews(){
        sectionTitle = UILabel()
        sectionTitle.text = "Social and Web Links"
        sectionTitle.font = UIFont(name: "ProximaNova-Bold", size: 16)
        sectionTitle.textColor = UIColor(red: 67/255, green: 133/255, blue: 255/255, alpha: 1.0)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sectionTitle)
    }
    
    private func initConstraints(){
        NSLayoutConstraint(item: sectionTitle, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: sectionTitle, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 25.0).active = true
    }
    
    func cellLog(){
        print("This is SocialLinkTitleCell!")
    }
}

class SocialLinkAddCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 56.0
    
    //MARK:- User components declarations
    var addButton: UIButton!
    
    // MARK:- Methods
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }
    
    private func initViews(){
        // configure addButton
        addButton = UIButton()
        addButton.setTitle("Add New Link", forState: .Normal)
        addButton.titleLabel?.font = UIFont(name: "ProximaNova-Regular", size: 14)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitleColor(UIColor(red: 67/255, green: 133/255, blue: 255/255, alpha: 1.0), forState: .Normal)
        addButton.addTarget(self, action: #selector(SocialLinkAddCell.addWeblink(_:)), forControlEvents: .TouchUpInside)
        contentView.addSubview(addButton)
    }
    
    private func initConstraints(){
        NSLayoutConstraint(item: addButton, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: addButton, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1.0, constant: -22.0).active = true
    }
    
    func addWeblink(button: UIButton){
    }
    
    func cellLog(){
        print("This is SocialLinkAddCell!")
    }
}

class SocialLinkCell: UITableViewCell, CellPlotsAndPopulates, CellLogsValues {
    static let cellHeight: CGFloat = 86.0
    
    //MARK:- User components declarations
    var nameTitleLabel: UILabel!
    var nameValueField: UITextField!
    var urlLabel: UILabel!
    var urlValueField: UITextField!
    var deleteButton: UIButton!
    
    //TODO: uncomment below line once integrated
//    var deleteSocialAndWeblink: DeleteSocialAndWeblink!
    
    // MARK:- Methods
    func plot() {
        initViews()
        initConstraints()
        backgroundColor = UIColor.greenColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func deleteWeblink(button: UIButton){
//        deleteSocialAndWeblink()
    }
    
    func cellLog(){
        print("This is SocialLinkCell! nameValueField: \(nameValueField.text), urlValueField: \(urlValueField.text)")
    }
    
    private func initViews() {
        // configure nameTitleLabel
        nameTitleLabel = UILabel()
        nameTitleLabel.text = "Name"
        nameTitleLabel.font = UIFont(name: "ProximaNova-Medium", size: 14)
        nameTitleLabel.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameTitleLabel)
        
        // configure nameValueField
        nameValueField = UITextField()
        nameValueField.placeholder = "Type"
        nameValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        nameValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        nameValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameValueField)
        
        // configure urlLabel
        urlLabel = UILabel()
        urlLabel.text = "URL"
        urlLabel.font = UIFont(name: "ProximaNova-Medium", size: 14)
        urlLabel.textColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1.0)
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(urlLabel)
        
        // configure urlValueField
        urlValueField = UITextField()
        urlValueField.placeholder = "URL"
        urlValueField.font = UIFont(name: "ProximaNova-Medium", size: 17)
        urlValueField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        urlValueField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(urlValueField)
        
        // configure deleteButton
        deleteButton = UIButton()
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.titleLabel?.font = UIFont(name: "ProximaNova-Regular", size: 14)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitleColor(UIColor(red: 255/255, green: 120/255, blue: 72/255, alpha: 1.0), forState: .Normal)
        deleteButton.addTarget(self, action: #selector(SocialLinkCell.deleteWeblink(_:)), forControlEvents: .TouchUpInside)
        contentView.addSubview(deleteButton)
    }
    
    private func initConstraints() {
        // setting constraint on nameTitleLabel
        NSLayoutConstraint(item: nameTitleLabel, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: nameTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 6.0).active = true
        
        // setting constraint on nameValueField
        NSLayoutConstraint(item: nameValueField, attribute: .Left, relatedBy: .Equal, toItem: nameTitleLabel, attribute: .Left, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: nameValueField, attribute: .Top, relatedBy: .Equal, toItem: nameTitleLabel, attribute: .Bottom, multiplier: 1.0, constant: 6.0).active = true
        NSLayoutConstraint(item: nameValueField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 90.0).active = true
        NSLayoutConstraint(item: nameValueField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0).active = true
        
        // setting constraint on urlValueField
        NSLayoutConstraint(item: urlValueField, attribute: .Leading, relatedBy: .Equal, toItem: nameValueField, attribute: .Trailing, multiplier: 1.0, constant: 15.0).active = true
        NSLayoutConstraint(item: urlValueField, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1.0, constant: -15.0).active = true
        NSLayoutConstraint(item: urlValueField, attribute: .Height, relatedBy: .Equal, toItem: nameValueField, attribute: .Height, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: urlValueField, attribute: .Baseline, relatedBy: .Equal, toItem: nameValueField, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on urlLabel
        NSLayoutConstraint(item: urlLabel, attribute: .Leading, relatedBy: .Equal, toItem: urlValueField, attribute: .Leading, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: urlLabel, attribute: .Baseline, relatedBy: .Equal, toItem: nameTitleLabel, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
        
        // setting constraint on deleteButton
        NSLayoutConstraint(item: deleteButton, attribute: .Trailing, relatedBy: .Equal, toItem: urlValueField, attribute: .Trailing, multiplier: 1.0, constant: 0).active = true
        NSLayoutConstraint(item: deleteButton, attribute: .Baseline, relatedBy: .Equal, toItem: urlLabel, attribute: .Baseline, multiplier: 1.0, constant: 0).active = true
    }

}
