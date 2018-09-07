//
//  SwitchTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 07/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
  
  let cellTitleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let switchControl: UISwitch = {
    let switchControl = UISwitch()
    switchControl.isOn = false
    switchControl.translatesAutoresizingMaskIntoConstraints = false
    return switchControl
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addSubview(cellTitleLabel)
    addSubview(switchControl)
    
    // Set up textFieldTitle layout constraints
    cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    cellTitleLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
    cellTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // Set up switchControl layout constraints
    switchControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    switchControl.widthAnchor.constraint(equalToConstant: 51).isActive = true
    switchControl.heightAnchor.constraint(equalToConstant: 31).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
