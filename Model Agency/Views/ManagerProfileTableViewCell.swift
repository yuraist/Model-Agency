//
//  ManagerProfileTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 05/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ManagerProfileTableViewCell: UITableViewCell {
  var manager: User? {
    didSet {
      if let name = manager?.name {
        nameLabel.text = name
      } else if let username = manager?.username {
        nameLabel.text = username
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
    label.text = "Стецюк Екатерина"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.numberOfLines = 3
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let usernameLabel: UILabel = {
    let label = UILabel()
    label.text = "stezukE"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 17, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let modelsCountLabel: UILabel = {
    let label = UILabel()
    label.text = "Всего моделей – 29"
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
    addSubview(usernameLabel)
    addSubview(modelsCountLabel)
    
    // Set up the avatarImageView layout constraints
    avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    // Set up the nameLabel layout constraints
    nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    // Set up the usernameLabel layout constraints
    usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    usernameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
    usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    // Set up the modelsCountLabel layout constraints
    modelsCountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    modelsCountLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16).isActive = true
    modelsCountLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
    modelsCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
