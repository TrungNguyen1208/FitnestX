//
//  RegisterPresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import Foundation

protocol RegisterPresenterProtocol: AnyObject {
  var router: RegisterRouterProtocol { get }
  
  init(view: RegisterViewProtocol, router: RegisterRouterProtocol)
}

final class RegisterPresenter: RegisterPresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: RegisterViewProtocol?
  
  // MARK: - Public Variable
  
  public var router: RegisterRouterProtocol
  
  // MARK: - Public function
  
  init(view: RegisterViewProtocol, router: RegisterRouterProtocol) {
    self.view = view
    self.router = router
  }
}
