//
//  SegmentedControlTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 06/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class SegmentedControlTableViewCell: UITableViewCell {
  
  let cellTitleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let segmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: ["30 дней", "60 дней"])
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return segmentedControl
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addSubview(cellTitleLabel)
    addSubview(segmentedControl)
    
    // Set up cellTitleLabel layout constraints
    cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    cellTitleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
    cellTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // TODO: - Set up segmentedControl
    segmentedControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    segmentedControl.widthAnchor.constraint(equalToConstant: 120).isActive = true
    segmentedControl.heightAnchor.constraint(equalToConstant: 28).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
