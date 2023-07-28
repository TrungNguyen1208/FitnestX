//
//  RegisterPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import Foundation

protocol RegisterPresenterProtocol: AnyObject {
  func onLoginLabelDidTap()
  func onGetStartButtonDidTap(firstName: String, lastName: String, email: String, password: String)
}

final class RegisterPresenter: RegisterPresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: RegisterViewProtocol?
  var router: RegisterRouterProtocol!
  var fistNameValidator: FirstNameValidator!
  var lastNameValidator: LastNameValidator!
  var emailValidator: EmailValidator!
  var passValidator: PasswordValidator!
  
  // MARK: - Public function
    
  func onGetStartButtonDidTap(firstName: String, lastName: String, email: String, password: String) {
    if fistNameValidator.validate(firstName) != .valid {
      router.makeToast(R.string.localizable.register_invalid_first_name.localized())
      return
    }
    if lastNameValidator.validate(lastName) != .valid {
      router.makeToast(R.string.localizable.register_invalid_last_name.localized())
      return
    }
    if emailValidator.validate(email) != .valid {
      router.makeToast(R.string.localizable.login_invalid_email.localized())
      return
    }
    if passValidator.validate(password) != .valid {
      router.makeToast(R.string.localizable.login_forgot_pass().localized())
      return
    }
    
    router.navigateToCompleteProfileScreen()
  }
  
  func onLoginLabelDidTap() {
    router.popToLoginScreen()
  }
}
