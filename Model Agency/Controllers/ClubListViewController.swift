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
  
  var clubs = [Club]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getClubs()
    
    navigationItem.title = "Клубы"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить клуб", style: .plain, target: self, action: #selector(addNewClub))
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  private func getClubs() {
    let models = [Model(id: 1, fullName: "Стецюк Екатерина Витальевна", dateOfBirth: Date(timeIntervalSince1970: 635933763), city: "Иркутск"),
                  Model(id: 1, fullName: "Стецюк Екатерина Витальевна", dateOfBirth: Date(timeIntervalSince1970: 635933763), city: "Иркутск"),
                  Model(id: 1, fullName: "Стецюк Екатерина Витальевна", dateOfBirth: Date(timeIntervalSince1970: 635933763), city: "Иркутск")]
    clubs.append(Club(id: 1, name: "Lala", models: models))
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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let club = clubs[indexPath.row]
    let destinationViewController = ClubTableViewController()
    destinationViewController.club = club
    show(destinationViewController, sender: self)
  }
  
  @objc private func addNewClub() {
    let alertController = UIAlertController(title: "Новый клуб", message: "Введите название", preferredStyle: .alert)
    alertController.addTextField { (textField) in
      textField.placeholder = "Название клуба"
    }
    
    alertController.addAction(UIAlertAction(title: "Сохранить", style: .default, handler: { (action) in
      self.clubs.append(Club(id: 1, name: alertController.textFields?.first?.text ?? "", models: nil))
    }))
    alertController.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
    present(alertController, animated: true, completion: nil)
  }
}

