//
//  RegisterRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import Foundation

protocol RegisterRouterProtocol {
  func popToLoginScreen()
}

final class RegisterRouter: RegisterRouterProtocol {
  
  weak var view: RegisterViewController?
  
  func popToLoginScreen() {
    view?.navigationController?.popViewController(animated: true)
  }
}
