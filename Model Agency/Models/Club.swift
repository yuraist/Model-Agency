//
//  Club.swift
//  Model Agency
//
//  Created by Юрий Истомин on 22/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class Club {
  var id: Int
  var name: String
  var models: [Model]?
  
  init(id: Int, name: String, city: String, models: [Model]?) {
    self.id = id
    self.name = name
    self.models = models
  }
}
