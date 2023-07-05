//
//  LoginPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
  var router: LoginRouterProtocol { get }
  
  init(view: LoginViewProtocol, router: LoginRouterProtocol)
  
  func onLoginButtonDidTap(email: String, password: String)
  func onRegisterLabelDidTap()
}

final class LoginPresenter: LoginPresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: LoginViewProtocol?
  
  // MARK: - Public Variable
  
  public var router: LoginRouterProtocol
  
  // MARK: - Public function
  
  init(view: LoginViewProtocol, router: LoginRouterProtocol) {
    self.view = view
    self.router = router
  }
  
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
