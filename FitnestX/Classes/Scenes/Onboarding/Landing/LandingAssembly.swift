//
//  LandingAssembly.swift
//  FitnestX
//
//  Created by Trung Nguyen on 07/07/2023.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class LandingAssembly: Assembly {
  func assemble(container: Container) {
    container.register(LandingRouter.self) { (_, viewController: LandingViewController) in
      let router = LandingRouter()
      router.view = viewController
      return router
    }
    
    container.register(LandingPresenter.self) { (r, viewController: LandingViewController) in
      let presenter = LandingPresenter()
      presenter.view = viewController
      presenter.router = r.resolve(LandingRouter.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(LandingViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(LandingPresenter.self, argument: viewController)
    }
  }
}
