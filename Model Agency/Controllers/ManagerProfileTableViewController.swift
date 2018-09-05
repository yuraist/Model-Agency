//
//  ManagerProfileTableViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 05/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ManagerProfileTableViewController: UITableViewController {
  
  private let bioCellId = "bioCell"
  private let detailedCellId = "detailedCell"
  private let cellTexts = ["Список моделей", "Архив моделей"]
  
  var manager: User? {
    didSet {
      if let name = manager?.name {
        navigationItem.title = name
      } else if let username = manager?.username {
        navigationItem.title = username
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(ManagerProfileTableViewCell.self, forCellReuseIdentifier: bioCellId)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: detailedCellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    if row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: bioCellId, for: indexPath) as! ManagerProfileTableViewCell
      cell.manager = manager
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: detailedCellId, for: indexPath)
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = cellTexts[row-1]
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.row == 0 ? 146 : 44
  }
}
