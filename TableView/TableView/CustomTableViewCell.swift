//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Гость on 12.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var isNoFirstNameLabel:Bool? {
        return firstNameLabel.text?.isEmpty
    }
    
    var isNoUserImageView:Bool? {
        return userImageView.image == nil ? true : false
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
    let userImageView:UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(secondNameLabel)
        contentView.addSubview(userImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            if isNoFirstNameLabel == false && isNoUserImageView == false {
                firstNameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 30)
                secondNameLabel.frame = CGRect(x: 0, y: 70, width: frame.width, height: 30)
                ageLabel.frame = CGRect(x: 0, y: 35, width: frame.width, height: 30)
                userImageView.frame = CGRect(x: 0, y: 105, width: 30, height: 30)
            }
            else if isNoFirstNameLabel == true && isNoUserImageView == false {
                firstNameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 0)
                secondNameLabel.frame = CGRect(x: 0, y: 35, width: frame.width, height: 30)
                ageLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 30)
                userImageView.frame = CGRect(x: 0, y: 70, width: 30, height: 30)
            }
            else if isNoFirstNameLabel == false && isNoUserImageView == true {
                firstNameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 30)
                secondNameLabel.frame = CGRect(x: 0, y: 70, width: frame.width, height: 30)
                ageLabel.frame = CGRect(x: 0, y: 35, width: frame.width, height: 30)
                userImageView.frame = CGRect(x: 0, y: 70, width: 30, height: 0)
            }
            else {
                firstNameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 0)
                secondNameLabel.frame = CGRect(x: 0, y: 35, width: frame.width, height: 30)
                ageLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: 30)
                userImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 0)
            }
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        if isNoFirstNameLabel == false && isNoUserImageView == false {
            return CGSize(width: size.width, height: 135)
        }
        else if isNoFirstNameLabel == false && isNoUserImageView == true {
            return CGSize(width: size.width, height: 100)
        }
        else if isNoFirstNameLabel == true && isNoUserImageView == false {
            return CGSize(width: size.width, height: 100)
        }
        else {
            return CGSize(width: size.width, height: 65)
        }
    }
}
