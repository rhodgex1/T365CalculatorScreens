//
//  CellFullWidthSeparator.swift
//  T365CalculatorScreens
//
//  Created by Devarshi Kulshreshtha on 5/11/16.
//  Copyright © 2016 Xome Labs. All rights reserved.
//

import UIKit

//TODO: Use this protocol to show full width separator in place of adding a separate UIView with 1 height as separator
protocol CellFullWidthSeparator {
    func adjustCellSeparatorMargin(theTableCell:UITableViewCell)
}

extension CellFullWidthSeparator {
    func adjustCellSeparatorMargin(tableViewCell:UITableViewCell) {
        if(tableViewCell.respondsToSelector(Selector("setLayoutMargins:"))){
            tableViewCell.layoutMargins = UIEdgeInsetsZero;
        }
        
        if(tableViewCell.respondsToSelector(Selector("setSeparatorInset:"))){
            tableViewCell.separatorInset = UIEdgeInsetsZero
        }
    }
}

