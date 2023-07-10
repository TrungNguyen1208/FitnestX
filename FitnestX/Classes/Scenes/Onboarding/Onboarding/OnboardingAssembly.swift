//
//  OnboardingAssembly.swift
//  FitnestX
//
//  Created by Trung Nguyen on 07/07/2023.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class OnboardingAssembly: Assembly {
  func assemble(container: Container) {
    container.register(OnboardingRouter.self) { (_, viewController: OnboardingViewController) in
      let router = OnboardingRouter()
      router.view = viewController
      return router
    }
    
    container.register(OnboardingPresenter.self) { (r, viewController: OnboardingViewController) in
      let presenter = OnboardingPresenter()
      presenter.view = viewController
      presenter.router = r.resolve(OnboardingRouter.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(OnboardingViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(OnboardingPresenter.self, argument: viewController)
    }
  }
}
