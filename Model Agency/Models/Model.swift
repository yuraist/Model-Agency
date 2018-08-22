//
//  Model.swift
//  Model Agency
//
//  Created by Юрий Истомин on 22/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class Model {
  var id: Int
  var fullName: String
  var dateOfBirth: Date
  var city: String
  var phone: String?
  var departureDate: Date?
  var startDate: Date?
  var ticketPrice: Float?
  var isAccepted = false
  var period: Int?
  var manager: User?
  var club: Club?
  
  // TODO: - Add photo
  
  init(id: Int, fullName: String, dateOfBirth: Date, city: String, phone: String?,
       departureDate: Date?, startDate: Date?, ticketPrice: Float?, isAccepted: Bool,
       period: Int?, manager: User?, club: Club?) {
    self.id = id
    self.fullName = fullName
    self.dateOfBirth = dateOfBirth
    self.city = city
    self.phone = phone
    self.departureDate = departureDate
    self.startDate = startDate
    self.ticketPrice = ticketPrice
    self.isAccepted = isAccepted
    self.period = period
    self.manager = manager
    self.club = club
  }
}
