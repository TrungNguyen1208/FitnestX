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
  func navigateToWelcomeScreen(_ delegate: NoticeViewControllerDelegate)
  func navigateToDashboardScreen()
  func makeToast(_ message: String)
}

final class LoginRouter: LoginRouterProtocol {
  
  weak var view: LoginViewController?
  
  func navigateToRegisterScreen() {
    let vc = RegisterViewController.makeMe()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func navigateToWelcomeScreen(_ delegate: NoticeViewControllerDelegate) {
    let vc = NoticeViewController.makeMe()
    let viewModel = NoticeViewModel(
      imageName: R.image.welcomeBack.name,
      title: "Welcome, Stefani",
      subtitle: "You are all set now, let’s reach your\n goals together with us",
      primaryButtonTitle: R.string.localizable.common_go_to_home.localized()
    )
    vc.modalPresentationStyle = .fullScreen
    vc.viewModel = viewModel
    vc.delegate = delegate
    view?.navigationController?.present(vc, animated: true)
  }
  
  func navigateToDashboardScreen() {
    NotificationCenter.default.post(name: AccountNotifications.authorizationCompleted, object: nil)
  }
  
  func makeToast(_ message: String) {
    view?.view.makeToast(message)
  }
}
