//
//  User.swift
//  Model Agency
//
//  Created by Юрий Истомин on 22/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class User {
  var id: Int
  var name: String?
  var username: String
  var password: String
  var isRoot = false
  var isAdmin = false
  var models: [Model]?
  var accessToken: String?
  
  static var currentUser: User?
  
  // TODO: - Add photo
  
  init(id: Int, name: String?, username: String, password: String, isRoot: Bool?, isAdmin: Bool?, accessToken: String?) {
    self.id = id
    self.username = username
    self.password = password
    self.isRoot = isRoot ?? false
    self.isAdmin = isAdmin ?? false 
  }
  
  init(id: Int, username: String, password: String) {
    self.id = id
    self.username = username
    self.password = password
  }
}
