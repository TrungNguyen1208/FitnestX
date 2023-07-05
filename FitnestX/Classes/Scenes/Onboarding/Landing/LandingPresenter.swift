//
//  LandingPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LandingPresenterProtocol: AnyObject {
  var router: LandingRouterProtocol { get }
  
  init(view: LandingViewProtocol, router: LandingRouterProtocol)
}

final class LandingPresenter: LandingPresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: LandingViewProtocol?
  
  // MARK: - Public Variable
  
  public var router: LandingRouterProtocol
  
  // MARK: - Public function
  
  init(view: LandingViewProtocol, router: LandingRouterProtocol) {
    self.view = view
    self.router = router
  }
}
