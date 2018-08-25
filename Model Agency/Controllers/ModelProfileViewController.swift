//
//  ModelProfileViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 25/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ModelProfileViewController: UITableViewController {
  private let bioCellId = "bioCell"
  private let basicCellId = "basicCell"
  
  var model: Model?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Модель"
    tableView.register(ModelProfileTableViewCell.self, forCellReuseIdentifier: bioCellId)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: basicCellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: bioCellId, for: indexPath) as! ModelProfileTableViewCell
      cell.model = model
      return cell
    }
    return tableView.dequeueReusableCell(withIdentifier: basicCellId, for: indexPath)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 { return 146 }
    return 44
  }
}
