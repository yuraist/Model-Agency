//
//  TextFieldTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 06/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
  
  let cellTitleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let textField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addSubview(cellTitleLabel)
    addSubview(textField)
    
    // Set up textFieldTitle layout constraints
    cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    cellTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    cellTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // Set up textField layout constraints
    textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    textField.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 12).isActive = true
    textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
