//
//  NewModelTableViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 06/09/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class NewModelTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  var clubs = ["Одинокий Джо", "Иркутский бандит", "Трое из ларца"]
  
  private let textFieldCellId = "textFieldCell"
  private let pickerCellId = "pickerCell"
  private let segmentedControlCellId = "segmentedControlCell"
  private let buttonCellId = "buttonCell"
  
  private let titles = ["ФИО", "Город", "Номер телефона",
                        "Дата рождения", "Желаемая дата вылета",
                        "Дата начала работы", "Клуб",
                        "Срок работы", "Загрузить аватар",
                        "Загрузить фото в галерею"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Новая модель"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveModel))
    
    tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: textFieldCellId)
    tableView.register(SegmentedControlTableViewCell.self, forCellReuseIdentifier: segmentedControlCellId)
    tableView.register(PickerTableViewCell.self, forCellReuseIdentifier: pickerCellId)
    tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: buttonCellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    let cellTitle = titles[row]
    
    switch row {
    case 0...5:
      let cell = tableView.dequeueReusableCell(withIdentifier: textFieldCellId, for: indexPath) as! TextFieldTableViewCell
      cell.cellTitleLabel.text = cellTitle
      cell.textField.placeholder = "Введите " + cellTitle.lowercased()
      return cell
    case 6:
      let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellId, for: indexPath) as! PickerTableViewCell
      cell.cellTitleLabel.text = cellTitle
      cell.picker.dataSource = self
      cell.picker.delegate = self
      return cell
    case 7:
      let cell = tableView.dequeueReusableCell(withIdentifier: segmentedControlCellId, for: indexPath) as! SegmentedControlTableViewCell
      cell.cellTitleLabel.text = cellTitle
      return cell
    case 8, 9:
      let cell = tableView.dequeueReusableCell(withIdentifier: buttonCellId, for: indexPath) as! ButtonTableViewCell
      cell.button.setTitle(cellTitle, for: .normal)
      return cell
    default:
      return UITableViewCell(style: .default, reuseIdentifier: "default")
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 6 {
      return 160
    }
    return indexPath.row < 6 ? 88 : 44
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return clubs.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return clubs[row]
  }
  
  @objc private func saveModel() {
    
  }
}
