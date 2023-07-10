import Foundation
import Swinject
import SwinjectStoryboard

final class DashboardAssembly: Assembly {
  func assemble(container: Container) {
    container.register(DashboardRouter.self) { (_, viewController: DashboardViewController) in
      let router = DashboardRouter()
      router.view = viewController
      return router
    }
    
    container.register(DashboardPresenter.self) { (r, viewController: DashboardViewController) in
      let presenter = DashboardPresenter()
      presenter.view = viewController
      presenter.router = r.resolve(DashboardRouter.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(DashboardViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(DashboardPresenter.self, argument: viewController)
    }
  }
}
