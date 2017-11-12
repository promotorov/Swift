//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Гость on 12.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var isExpanded:Bool {
        if(firstNameLabel.text?.isEmpty == true) {
            print("empty")
            return true
        }
        return false
    }
    
    let firstNameLabel:UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        return label
    }()
    let secondNameLabel:UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        return label
    }()
    let ageLabel:UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(secondNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            if(isExpanded == false) {
                firstNameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 30)
                secondNameLabel.frame = CGRect(x: 0, y: 70, width: frame.width, height: 30)
                ageLabel.frame = CGRect(x: 0, y: 35, width: frame.width, height: 30)
            }
            else {
                firstNameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 0)
                secondNameLabel.frame = CGRect(x: 0, y: 35, width: frame.width, height: 30)
                ageLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 30)
            }
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        return CGSize(width: size.width, height: isExpanded ? 65 : 100)
    }
}
