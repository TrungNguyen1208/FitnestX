//
//  LoginPresenterTest.swift
//  FitnestXTests
//
//  Created by Trung Nguyen on 05/07/2023.
//

import XCTest
@testable import FitnestX

final class LoginPresenterTests: XCTestCase {

  var presenter: LoginPresenter!
  var viewMock: LoginViewProtocol!
  var routerMock: LoginRouterMock!

  override func setUp() {
    super.setUp()
    let loginVc = LoginViewController()
    viewMock = loginVc
    routerMock = LoginRouterMock(view: loginVc)
    presenter = LoginPresenter(view: viewMock, router: routerMock)
  }

  override func tearDown() {
    presenter = nil
    viewMock = nil
    routerMock = nil
    super.tearDown()
  }

  func testSuccessfulLogin() {
    presenter.onLoginButtonDidTap(email: "test@example.com", password: "password")
    
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testInvalidEmail() {
    presenter.onLoginButtonDidTap(email: "invalid_email", password: "password")
    
    XCTAssertTrue(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testInvalidPassword() {
    presenter.onLoginButtonDidTap(email: "test@example.com", password: "12345")
    
    XCTAssertTrue(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testRegisterLabelDidTap() {
    presenter.onRegisterLabelDidTap()
    
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertTrue(routerMock.didNavigateToRegisterScreen)
  }
}

final class LoginRouterMock: LoginRouterProtocol {
  required init(view: FitnestX.LoginViewController) {
    
  }
  
  var didMakeToast = false
  var lastToastMessage: String?
  var didNavigateToRegisterScreen = false
  
  func makeToast(_ message: String) {
    didMakeToast = true
    lastToastMessage = message
  }
  
  func navigateToDashboardScreen() {}
  
  func navigateToRegisterScreen() {
    didNavigateToRegisterScreen = true
  }
}
