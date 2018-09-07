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
  
    getModels()
    
    navigationItem.title = "Модели"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить модель", style: .plain, target: self, action: #selector(addNewModel))
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  private func getModels() {
    models.append(Model(id: 1, fullName: "Стецюк Екатерина Витальевна", dateOfBirth: Date(timeIntervalSince1970: 635933763), city: "Иркутск"))
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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let model = models[indexPath.row]
    let destinationViewController = ModelProfileViewController()
    destinationViewController.model = model
    show(destinationViewController, sender: self)
  }
  
  @objc private func addNewModel() {
    let newModelViewController = NewModelTableViewController()
    show(newModelViewController, sender: self)
  }
}
