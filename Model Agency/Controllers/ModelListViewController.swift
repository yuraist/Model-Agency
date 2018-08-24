//
//  ModelListViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 24/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class ModelListViewController: UITableViewController {
  
  private let cellId = "modelListCell"
  
  var models = [Model]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    navigationItem.title = "Модели"
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.accessoryType = .disclosureIndicator
    
    let model = models[indexPath.row]
    cell.textLabel?.text = model.fullName
    cell.detailTextLabel?.text = model.city
    return cell
  }
  
}
