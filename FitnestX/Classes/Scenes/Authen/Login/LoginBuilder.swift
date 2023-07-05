//
//  LoginBuilder.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import Foundation

final class LoginBuilder {
  
  public static func build() -> LoginViewController {
    let view = LoginViewController.makeMe()
    let router = LoginRouter(view: view)
    let presenter = LoginPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
  
}
