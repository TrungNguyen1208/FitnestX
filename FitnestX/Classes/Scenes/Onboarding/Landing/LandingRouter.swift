//
//  LandingRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

protocol LandingRouterProtocol {
  func navigateToOnboardingScreen()
}

final class LandingRouter: LandingRouterProtocol {
  
  weak var view: LandingViewController?
  
  func navigateToOnboardingScreen() {
    let vc = OnboardingViewController.makeMe()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
}
