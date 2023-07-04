//
//  RegisterRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import Foundation

protocol RegisterRouterProtocol {
  init(view: RegisterViewController)
}

final class RegisterRouter: RegisterRouterProtocol {
  
  private weak var view: RegisterViewController?

  init(view: RegisterViewController) {
    self.view = view
  }
}
