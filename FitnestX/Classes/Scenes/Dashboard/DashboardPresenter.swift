//
//  DashboardPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 17/06/2023.
//  
//

import Foundation

protocol DashboardPresenterProtocol: AnyObject {
  var router: DashboardRouterProtocol { get }
  
  init(view: DashboardViewProtocol, router: DashboardRouterProtocol)
}

final class DashboardPresenter: DashboardPresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: DashboardViewProtocol?
  
  // MARK: - Public Variable
  
  public var router: DashboardRouterProtocol
  
  // MARK: - Public function
  
  init(view: DashboardViewProtocol, router: DashboardRouterProtocol) {
    self.view = view
    self.router = router
  }
}
