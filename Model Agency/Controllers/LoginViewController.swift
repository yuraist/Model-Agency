//
//  ViewController.swift
//  Model Agency
//
//  Created by Юрий Истомин on 21/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  var isLoginModeDisplaying = true
  
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
  
  var loginTextField: CustomTextField = {
    let tf = CustomTextField()
    tf.placeholder = "Логин"
    tf.autocorrectionType = .no
    tf.autocapitalizationType = .none
    tf.layer.cornerRadius = 5
    tf.layer.borderWidth = 1
    tf.layer.borderColor = UIColor.color(withRed: 227, green: 227, blue: 227).cgColor
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  var passwordTextField: CustomTextField = {
    let tf = CustomTextField()
    tf.placeholder = "Пароль"
    tf.isSecureTextEntry = true
    tf.layer.cornerRadius = 5
    tf.layer.borderWidth = 1
    tf.layer.borderColor = UIColor.color(withRed: 227, green: 227, blue: 227).cgColor
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  var loginButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.color(withRed: 0, green: 122, blue: 255)
    button.setTitle("Войти", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 22
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var signUpButton: UIButton = {
    let button = UIButton()
    button.setTitle("Зарегистрироваться", for: .normal)
    button.setTitleColor(UIColor.color(withRed: 0, green: 122, blue: 255), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if #available(iOS 11.0, *) {
      navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    navigationItem.title = "Войти"
    view.backgroundColor = .white
    
    // Setup views and their layout constraints
    setupViews()
    setupButtonActions()
    setupTextFieldsDelegate()
  }
  
  private func setupViews() {
    view.addSubview(inputsContainerView)
    inputsContainerView.addSubview(loginTextField)
    inputsContainerView.addSubview(passwordTextField)
    inputsContainerView.addSubview(loginButton)
    view.addSubview(signUpButton)
    
    // inputsContainerView layout constraints
    if #available(iOS 11.0, *) {
      inputsContainerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
      inputsContainerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
    } else {
      inputsContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
      inputsContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    }
    inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    inputsContainerView.heightAnchor.constraint(equalToConstant: 204).isActive = true
    
    // loginTextField layout constraints
    loginTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 16).isActive = true
    loginTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 18).isActive = true
    loginTextField.rightAnchor.constraint(equalTo: inputsContainerView.rightAnchor, constant: -16).isActive = true
    loginTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    
    // passwordTextField layout constraints
    passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 16).isActive = true
    passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16).isActive = true
    passwordTextField.rightAnchor.constraint(equalTo: inputsContainerView.rightAnchor, constant: -16).isActive = true
    passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    
    
    // loginButton layout constraints
    loginButton.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 16).isActive = true
    loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
    loginButton.rightAnchor.constraint(equalTo: inputsContainerView.rightAnchor, constant: -16).isActive = true
    loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    
    // signUpButton layout constraints
    signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    signUpButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 16).isActive = true
    signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
    signUpButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
  }
  
  private func setupButtonActions() {
    loginButton.addTarget(self, action: #selector(chooseAction(sender:)), for: .touchUpInside)
    signUpButton.addTarget(self, action: #selector(chooseAction(sender:)), for: .touchUpInside)
    
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
  }
  
  private func setupTextFieldsDelegate() {
    loginTextField.delegate = self
    passwordTextField.delegate = self
  }
  
  private func changeDisplayingMode() {
    isLoginModeDisplaying = !isLoginModeDisplaying
    if isLoginModeDisplaying {
      navigationItem.title = "Вход"
      loginButton.setTitle("Войти", for: .normal)
      signUpButton.setTitle("Зарегистироваться", for: .normal)
    } else {
      navigationItem.title = "Регистрация"
      loginButton.setTitle("Зарегистироваться", for: .normal)
      signUpButton.setTitle("Войти", for: .normal)
    }
  }
  
  private func logIn(username: String, password: String) {
    let alert = UIAlertController(title: "Вход", message: "Пользователь \(username) успешно авторизован!", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Хорошо", style: .default))
    present(alert, animated: true, completion: nil)
  }
  
  private func signUp(username: String, password: String) {
    let alert = UIAlertController(title: "Вход", message: "Пользователь \(username) успешно зарегистрирован!", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Хорошо", style: .default))
    present(alert, animated: true, completion: nil)
  }
  
  @objc private func hideKeyboard() {
    if loginTextField.isFirstResponder {
      loginTextField.resignFirstResponder()
    } else if passwordTextField.isFirstResponder {
      passwordTextField.resignFirstResponder()
    }
  }
  
  @objc func chooseAction(sender: UIButton) {
    // Check for action to do
    if sender == loginButton {
      
      // Check for filling fields
      if let username = loginTextField.text, let password = passwordTextField.text, username != "", password != "" {
        if loginButton.titleLabel?.text == "Войти" {
          logIn(username: username, password: password)
        } else {
          signUp(username: username, password: password)
        }
      } else {
        // Invalid data
      }
    } else {
      changeDisplayingMode()
    }
  }
  
  private func makeNextTextFieldFirstResponder() {
    if loginTextField.isFirstResponder {
      passwordTextField.becomeFirstResponder()
    } else if passwordTextField.isFirstResponder {
      passwordTextField.resignFirstResponder()
      perform(#selector(chooseAction(sender:)), with: loginButton)
    }
  }
  
  // MARK: - UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    makeNextTextFieldFirstResponder()
    return true
  }
}

extension UIColor {
  static func color(withRed red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}
