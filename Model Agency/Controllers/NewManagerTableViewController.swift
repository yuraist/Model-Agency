//
//  NewManagerTableViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 07/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class NewManagerTableViewController: UITableViewController {

  private let cellTitles = ["Имя менеджера", "Никнейм", "Пароль", "Администратор", "Загрузить аватар"]
  
  private let textFieldCellId = "textFieldCell"
  private let switchCellId = "switchCell"
  private let buttonCellId = "buttonCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Новый менеджер"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveManager))
    
    tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: textFieldCellId)
    tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: switchCellId)
    tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: buttonCellId)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    let cellTitle = cellTitles[row]
    switch row {
    case 0, 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: textFieldCellId, for: indexPath) as! TextFieldTableViewCell
      cell.cellTitleLabel.text = cellTitle
      cell.textField.placeholder = "Введите " + cellTitle.lowercased()
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: textFieldCellId, for: indexPath) as! TextFieldTableViewCell
      cell.cellTitleLabel.text = cellTitle
      cell.textField.isSecureTextEntry = true
      cell.textField.placeholder = "Введите " + cellTitle.lowercased()
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: switchCellId, for: indexPath) as! SwitchTableViewCell
      cell.cellTitleLabel.text = cellTitle
      return cell
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: buttonCellId, for: indexPath) as! ButtonTableViewCell
      cell.button.setTitle(cellTitle, for: .normal)
      return cell
    default:
      return UITableViewCell(style: .default, reuseIdentifier: "cellId")
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.row < 3 ? 88 : 44
  }
  
  @objc private func saveManager() {
    
  }
}
