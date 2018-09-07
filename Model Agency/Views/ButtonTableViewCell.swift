//
//  ButtonTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 06/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
  
  let button: UIButton = {
    let button = UIButton(type: UIButtonType.system)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addSubview(button)
    
    // Set up button layout constraints
    button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    button.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    button.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    button.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
