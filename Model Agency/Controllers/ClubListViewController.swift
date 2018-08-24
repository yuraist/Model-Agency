//
//  ClubListViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 24/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ClubListViewController: UITableViewController {
  
  private let cellId = "clubListCell"
  
  var clubs = [Club]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Клубы"
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return clubs.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.accessoryType = .disclosureIndicator
    cell.textLabel?.text = clubs[indexPath.row].name
    return cell
  }
  
}

