//
//  CustomTextField.swift
//  Model Agency
//
//  Created by Юрий Истомин on 23/08/2018.
//  Copyright © 2018 Yuri Istomin. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
  private let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(bounds, padding)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(bounds, padding)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(bounds, padding)
  }
}
