//
//  LoginRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LoginRouterProtocol {
  init(view: LoginViewController)
  
  func navigateToRegisterScreen()
  func navigateToDashboardScreen()
  func makeToast(_ message: String)
}

final class LoginRouter: LoginRouterProtocol {
  
  private weak var view: LoginViewController?

  init(view: LoginViewController) {
    self.view = view
  }
  
  func navigateToRegisterScreen() {
    let vc = RegisterBuilder.build()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func navigateToDashboardScreen() {
    NotificationCenter.default.post(name: AccountNotifications.authorizationCompleted, object: nil)
  }
  
  func makeToast(_ message: String) {
    view?.view.makeToast(message)
  }
}
