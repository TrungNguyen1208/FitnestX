//
//  LandingPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LandingPresenterProtocol: AnyObject {
  func onGetStartedButtonDidTap()
}

final class LandingPresenter: LandingPresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: LandingViewProtocol?
  var router: LandingRouterProtocol!
  
  func onGetStartedButtonDidTap() {
    router.navigateToOnboardingScreen()
  }
}
