//
//  PickerTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 06/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {
  
  let cellTitleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let picker: UIPickerView = {
    let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 320, height: 140))
    return picker
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addSubview(cellTitleLabel)
    addSubview(picker)
    
    // Set up textFieldTitle layout constraints
    cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    cellTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    cellTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // TODO: - Set up datePicker
    picker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    picker.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 8).isActive = true
    picker.widthAnchor.constraint(equalToConstant: 320).isActive = true
    picker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
