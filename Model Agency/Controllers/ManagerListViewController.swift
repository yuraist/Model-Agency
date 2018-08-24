//
//  ManagerListViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 24/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ManagerListViewController: UITableViewController {
  
  private let cellId = "managerListCell"
  
  var managers = [User]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Менеджеры"
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return managers.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.accessoryType = .disclosureIndicator
    let manager = managers[indexPath.row]
    if let managerName = manager.name {
      cell.textLabel?.text = managerName
      cell.detailTextLabel?.text = manager.username
    } else {
      cell.textLabel?.text = manager.username
    }
    
    return cell
  }
  
}

