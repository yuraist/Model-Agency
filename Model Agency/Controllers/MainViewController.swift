//
//  MainViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 24/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
  
  private let cellId = "mainCell"
  private let tableViewCellNames = ["Список моделей", "Список менеджеров", "Список клубов", "Архив моделей"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Главная"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(logout))
    
    if #available(iOS 11, *) {
      navigationController?.navigationBar.prefersLargeTitles = true
    }
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  @objc private func logout() {
    dismiss(animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewCellNames.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.accessoryType = .disclosureIndicator
    cell.textLabel?.text = tableViewCellNames[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cellName = tableViewCellNames[indexPath.row]
    var destinationViewController: UITableViewController?
    
    switch cellName {
    case tableViewCellNames[0]:
      destinationViewController = ModelListViewController()
    case tableViewCellNames[1]:
      destinationViewController = ManagerListViewController()
    case tableViewCellNames[2]:
      destinationViewController = ClubListViewController()
    default:
      break
    }
    
    if destinationViewController != nil {
      show(destinationViewController!, sender: self)
    }
  }
}
