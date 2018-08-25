//
//  ModelProfileTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 25/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ModelProfileTableViewCell: UITableViewCell {

  var model: Model? {
    didSet {
//      if let avatarUrl = model?.avatarImageUrl {
//        // Download photo and set up into avatarImageView
//      }

      if let name = model?.fullName {
        nameLabel.text = name
      }
      
      if let period = model?.period {
        periodLabel.text = "Осталось работать \(period) дней"
      }
    }
  }
  
  let avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "user")
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = imageView.bounds.size.height
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Стецюк Екатерина Витальевна"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.numberOfLines = 3
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let periodLabel: UILabel = {
    let label = UILabel()
    label.text = "Осталось работать \(30) дней"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 17, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    
    addSubview(avatarImageView)
    addSubview(nameLabel)
    addSubview(periodLabel)
    
    // Set up the avatarImageView layout constraints
    avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    // Set up the nameLabel layout constraints
    nameLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -16).isActive = true
    nameLabel.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: 16).isActive = true
    nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
    
    // Set up the periodLabel layout constraints
    periodLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    periodLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    periodLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
    periodLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
