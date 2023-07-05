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
  
  func onLoginButtonDidTap()
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
  
  func onLoginButtonDidTap() {
    
  }
  
  func onRegisterLabelDidTap() {
    router.navigateToRegisterScreen()
  }
}
