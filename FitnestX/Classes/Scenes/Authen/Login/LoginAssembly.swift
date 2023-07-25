//
//  LoginAssembly.swift
//  FitnestX
//
//  Created by Trung Nguyen on 07/07/2023.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class LoginAssembly: Assembly {
  func assemble(container: Container) {
    container.register(LoginRouter.self) { (_, viewController: LoginViewController) in
      let router = LoginRouter()
      router.view = viewController
      return router
    }
    
    container.register(LoginPresenter.self) { (r, viewController: LoginViewController) in
      let presenter = LoginPresenter()
      presenter.view = viewController
      presenter.emailValidator = r.resolve(EmailValidator.self)
      presenter.passValidator = r.resolve(PasswordValidator.self)
      presenter.router = r.resolve(LoginRouter.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(LoginViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(LoginPresenter.self, argument: viewController)
    }
  }
}
