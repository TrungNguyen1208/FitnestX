//
//  RegisterAssembly.swift
//  FitnestX
//
//  Created by Trung Nguyen on 07/07/2023.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class RegisterAssembly: Assembly {
  func assemble(container: Container) {
    container.register(RegisterRouter.self) { (_, viewController: RegisterViewController) in
      let router = RegisterRouter()
      router.view = viewController
      return router
    }
    
    container.register(RegisterPresenter.self) { (r, viewController: RegisterViewController) in
      let presenter = RegisterPresenter()
      presenter.view = viewController
      presenter.router = r.resolve(RegisterRouter.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(RegisterViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(RegisterPresenter.self, argument: viewController)
    }
  }
}
