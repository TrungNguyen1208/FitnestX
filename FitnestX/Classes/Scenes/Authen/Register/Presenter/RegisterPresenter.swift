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
}

final class RegisterPresenter: RegisterPresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: RegisterViewProtocol?
  var router: RegisterRouterProtocol!
  
  // MARK: - Public function
  
  func onLoginLabelDidTap() {
    router.popToLoginScreen()
  }
}
