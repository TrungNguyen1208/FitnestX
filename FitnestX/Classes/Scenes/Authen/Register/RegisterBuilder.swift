//
//  RegisterBuilder.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import Foundation

final class RegisterBuilder {
  
  public static func build() -> RegisterViewController {
    let view = RegisterViewController.makeMe()
    let router = RegisterRouter(view: view)
    let presenter = RegisterPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
  
}
