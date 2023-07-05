//
//  LandingBuilder.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

final class LandingBuilder {
  
  public static func build() -> LandingViewController {
    let view = LandingViewController.makeMe()
    let router = LandingRouter(view: view)
    let presenter = LandingPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
  
}
