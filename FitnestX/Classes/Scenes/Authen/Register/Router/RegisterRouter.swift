//
//  RegisterRouter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import Foundation

protocol RegisterRouterProtocol {
  func navigateToCompleteProfileScreen()
  func popToLoginScreen()
  func makeToast(_ message: String)
}

final class RegisterRouter: RegisterRouterProtocol {
  
  weak var view: RegisterViewController?
  
  func popToLoginScreen() {
    view?.navigationController?.popViewController(animated: true)
  }
  
  func navigateToCompleteProfileScreen() {
    let vc = CompleteProfileViewController.makeMe()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func makeToast(_ message: String) {
    view?.view.makeToast(message)
  }
}
