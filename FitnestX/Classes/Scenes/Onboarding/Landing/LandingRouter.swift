//
//  LandingRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LandingRouterProtocol {
  init(view: LandingViewController)
}

final class LandingRouter: LandingRouterProtocol {
  
  private weak var view: LandingViewController?

  init(view: LandingViewController) {
    self.view = view
  }
}
