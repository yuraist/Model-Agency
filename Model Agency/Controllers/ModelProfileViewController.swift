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
  private let detailedCellId = "detailedCell"
  
  private let cellTexts = ["Одобрена",
                           "Галерея фотографий",
                           "Менеджер",
                           "Клуб",
                           "Город",
                           "Дата рождения",
                           "Номер телефона",
                           "Цена билета",
                           "Желаемая дата вылета",
                           "Дата начала работы"]
  
  var model: Model?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Модель"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ModelProfileTableViewCell.self, forCellReuseIdentifier: bioCellId)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: basicCellId)
//    tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: detailedCellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellTexts.count + 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    switch row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: bioCellId, for: indexPath) as! ModelProfileTableViewCell
      cell.model = model
      return cell
    case 1, 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: basicCellId, for: indexPath)
      cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
      cell.textLabel?.text = cellTexts[row-1]
      cell.accessoryType = .disclosureIndicator
      return cell
    case 3, 4:
      let cell: DetailTableViewCell = {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detailedCellId) as? DetailTableViewCell else {
          return DetailTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: detailedCellId)
        }
        return cell
      }()
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = "Не установлено пока"
      cell.detailTextLabel?.text = cellTexts[row-1]
      return cell
    case 5...11:
      let cell: DetailTableViewCell = {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detailedCellId) as? DetailTableViewCell else {
          return DetailTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: detailedCellId)
        }
        return cell
      }()
      
      cell.textLabel?.text = "Not set"
      cell.detailTextLabel?.text = cellTexts[row-1]
      return cell
    default:
      return tableView.dequeueReusableCell(withIdentifier: basicCellId, for: indexPath)
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.row == 0 ? 146 : 44
  }
}
