//
//  NoticeAssembly.swift
//  FitnestX
//
//  Created by Trung Nguyen on 25/07/2023.
//  
//

import Foundation
import Swinject
import SwinjectStoryboard

final class NoticeAssembly: Assembly {
  func assemble(container: Container) {
    container.register(NoticeRouter.self) { (_, viewController: NoticeViewController) in
      let router = NoticeRouter()
      router.view = viewController
      return router
    }
    
    container.register(NoticePresenter.self) { (r, viewController: NoticeViewController) in
      let presenter = NoticePresenter()
      presenter.view = viewController
      presenter.router = r.resolve(NoticeRouter.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(NoticeViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(NoticePresenter.self, argument: viewController)
    }
  }
}
