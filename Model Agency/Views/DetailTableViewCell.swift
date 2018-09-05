//
//  DetailTableViewCell.swift
//  Model Agency
//
//  Created by Юрий Истомин on 05/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
  
  var manager: User? {
    didSet {
      detailTextLabel?.text = "Менеджер"
      if let name = manager?.name {
        textLabel?.text = name
      } else if let username = manager?.username {
        textLabel?.text = username
      }
    }
  }
  
  var club: Club? {
    didSet {
      detailTextLabel?.text = "Клуб"
      if let name = club?.name {
        textLabel?.text = name
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
