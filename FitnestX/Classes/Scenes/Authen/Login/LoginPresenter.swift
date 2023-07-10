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
  
  // MARK: - Public function
  
  func onLoginButtonDidTap(email: String, password: String) {
    let emailValidator: EmailValidator = EmailValidatorImpl()
    if emailValidator.validate(email) != .valid {
      router.makeToast(R.string.localizable.login_invalid_email.localized())
      return
    }
    let passValidator: PasswordValidator = PasswordValidatorImpl()
    if passValidator.validate(password) != .valid {
      router.makeToast(R.string.localizable.login_invalid_password.localized())
      return
    }
    router.navigateToDashboardScreen()
  }
  
  func onRegisterLabelDidTap() {
    router.navigateToRegisterScreen()
  }
}
