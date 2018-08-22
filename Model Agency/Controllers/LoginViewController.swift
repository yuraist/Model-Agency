//
//  ViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 21/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  var inputsContainerView: UIView = {
    let inputsContainerView = UIView()
    inputsContainerView.backgroundColor = .white
    inputsContainerView.layer.shadowColor = UIColor.black.cgColor
    inputsContainerView.layer.shadowOpacity = 0.1
    inputsContainerView.layer.shadowRadius = 15
    inputsContainerView.layer.shadowOffset = CGSize(width: 0, height: 5)
    inputsContainerView.layer.cornerRadius = 15
//    If we need to clip content READ this post
//    https://medium.com/swifty-tim/views-with-rounded-corners-and-shadows-c3adc0085182
//    inputsContainerView.layer.masksToBounds = true
    inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
    return inputsContainerView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if #available(iOS 11.0, *) {
      navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    navigationItem.title = "Войти"
    view.backgroundColor = .white
    
    setupViews()
  }

  private func setupViews() {
    view.addSubview(inputsContainerView)
    
    if #available(iOS 11.0, *) {
      inputsContainerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
      inputsContainerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
    } else {
      inputsContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
      inputsContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    }
    inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    inputsContainerView.heightAnchor.constraint(equalToConstant: 204).isActive = true
  }

}

