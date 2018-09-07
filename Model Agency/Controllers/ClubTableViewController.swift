//
//  ClubTableViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 06/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ClubTableViewController: UITableViewController {
  
  private let cellId = "modelCell"
  var club: Club?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = club?.name
    tableView.register(ModelProfileTableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return club?.models?.count ?? 0
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ModelProfileTableViewCell
    
    let row = indexPath.row
    if let models = club?.models {
      cell.model = models[row]
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 146
  }
}
