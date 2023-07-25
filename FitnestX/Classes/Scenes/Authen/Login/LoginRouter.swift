//
//  LoginRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LoginRouterProtocol {
  func navigateToRegisterScreen()
  func navigateToWelcomeScreen()
//  func navigateToDashboardScreen()
  func makeToast(_ message: String)
}

final class LoginRouter: LoginRouterProtocol {
  
  weak var view: LoginViewController?
  
  func navigateToRegisterScreen() {
    let vc = RegisterViewController.makeMe()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func navigateToWelcomeScreen() {
    let vc = NoticeViewController.makeMe()
    vc.modalPresentationStyle = .fullScreen
    view?.navigationController?.present(vc, animated: true)
  }
  
//  func navigateToDashboardScreen() {
//    NotificationCenter.default.post(name: AccountNotifications.authorizationCompleted, object: nil)
//  }
  
  func makeToast(_ message: String) {
    view?.view.makeToast(message)
  }
}
