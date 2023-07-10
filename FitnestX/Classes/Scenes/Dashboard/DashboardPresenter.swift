import Foundation

protocol DashboardPresenterProtocol: AnyObject {

}

final class DashboardPresenter: DashboardPresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: DashboardViewProtocol?
  var router: DashboardRouterProtocol!

}
