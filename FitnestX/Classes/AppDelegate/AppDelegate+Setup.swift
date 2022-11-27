//
//  AppDelegate+Setup.swift
//  FitnestX
//
//  Created by Trung Nguyen on 23/11/2022.
//

import Foundation
import IQKeyboardManagerSwift

extension AppDelegate {
  func setupAppearance() {
    setupIQKeyboard()
    setupToastView()
    setupSVProgressHUD()
  }
}

private extension AppDelegate {
  func setupIQKeyboard() {
    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.enableAutoToolbar = true
    IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
  }
  
  func setupToastView() {

  }
  
  func setupSVProgressHUD() {

  }
}
