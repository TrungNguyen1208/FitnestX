import Foundation

protocol DashboardRouterProtocol {
  init(view: DashboardViewController)
}

final class DashboardRouter: DashboardRouterProtocol {
  
  private weak var view: DashboardViewController?

  init(view: DashboardViewController) {
    self.view = view
  }
}
