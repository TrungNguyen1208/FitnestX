//
//  DashboardBuilder.swift
//  FitnestX
//
//  Created by Trung Nguyen on 17/06/2023.
//  
//

import Foundation

final class DashboardBuilder {
  
  public static func build() -> DashboardViewController {
    let view = DashboardViewController.makeMe()
    let router = DashboardRouter(view: view)
    let presenter = DashboardPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
  
}
