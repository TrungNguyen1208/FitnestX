//
//  LoginPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
  func onLoginButtonDidTap(email: String, password: String)
  func onRegisterLabelDidTap()
}

final class LoginPresenter: LoginPresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: LoginViewProtocol?
  var router: LoginRouterProtocol!
  var emailValidator: EmailValidator!
  var passValidator: PasswordValidator!
  
  // MARK: - Public function
  
  func onLoginButtonDidTap(email: String, password: String) {
    if emailValidator.validate(email) != .valid {
      router.makeToast(R.string.localizable.login_invalid_email.localized())
      return
    }
    if passValidator.validate(password) != .valid {
      router.makeToast(R.string.localizable.login_invalid_password.localized())
      return
    }
    router.navigateToWelcomeScreen(self)
  }
  
  func onRegisterLabelDidTap() {
    router.navigateToRegisterScreen()
  }
}

extension LoginPresenter: NoticeViewControllerDelegate {
  func primaryButtonNoticeDidTap() {
    router.navigateToDashboardScreen()
  }
}
