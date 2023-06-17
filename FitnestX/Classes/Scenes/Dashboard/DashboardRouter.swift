//
//  DashboardRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 17/06/2023.
//  
//

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
