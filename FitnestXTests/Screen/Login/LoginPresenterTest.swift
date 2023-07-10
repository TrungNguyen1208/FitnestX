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
  var viewMock: LoginViewMock!
  var routerMock: LoginRouterMock!

  override func setUp() {
    super.setUp()
    viewMock = LoginViewMock()
    routerMock = LoginRouterMock()
    presenter = LoginPresenter()
    presenter.view = viewMock
    presenter.router = routerMock
  }

  override func tearDown() {
    presenter = nil
    viewMock = nil
    routerMock = nil
    super.tearDown()
  }

  func testValidLogin() {
    // Arrange
    let email = "test@example.com"
    let password = "password"
    
    // Act
    presenter.onLoginButtonDidTap(email: email, password: password)
    
    // Assert
    XCTAssertTrue(routerMock.didNavigateToDashboardScreen)
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testInvalidEmail() {
    // Arrange
    let email = "invalid_email"
    let password = "password"
    
    // Act
    presenter.onLoginButtonDidTap(email: email, password: password)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToDashboardScreen)
    XCTAssertTrue(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testInvalidPassword() {
    // Arrange
    let email = "test@example.com"
    let password = "12345"
    
    // Act
    presenter.onLoginButtonDidTap(email: email, password: password)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToDashboardScreen)
    XCTAssertTrue(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testRegisterLabelDidTap() {
    // Act
    presenter.onRegisterLabelDidTap()
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToDashboardScreen)
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertTrue(routerMock.didNavigateToRegisterScreen)
  }
}

// Mock Classes

final class LoginViewMock: LoginViewProtocol {}

final class LoginRouterMock: LoginRouterProtocol {
  var didMakeToast = false
  var lastToastMessage: String?
  var didNavigateToRegisterScreen = false
  var didNavigateToDashboardScreen = false
  
  func makeToast(_ message: String) {
    didMakeToast = true
    lastToastMessage = message
  }
  
  func navigateToDashboardScreen() {
    didNavigateToDashboardScreen = true
  }
  
  func navigateToRegisterScreen() {
    didNavigateToRegisterScreen = true
  }
}
