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
  var emailValidatorMock: EmailValidatorMock!
  var passValidatorMock: PasswordValidatorMock!
  
  override func setUp() {
    super.setUp()
    viewMock = LoginViewMock()
    routerMock = LoginRouterMock()
    emailValidatorMock = EmailValidatorMock()
    passValidatorMock = PasswordValidatorMock()
    
    presenter = LoginPresenter()
    presenter.view = viewMock
    presenter.router = routerMock
    presenter.emailValidator = emailValidatorMock
    presenter.passValidator = passValidatorMock
  }
  
  override func tearDown() {
    presenter = nil
    viewMock = nil
    routerMock = nil
    emailValidatorMock = nil
    passValidatorMock = nil
    super.tearDown()
  }
  
  func testValidLogin() {
    // Arrange
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .valid
    let email = "test@example.com"
    let password = "securePassword"
    
    // Act
    presenter.onLoginButtonDidTap(email: email, password: password)
    
    // Assert
    XCTAssertTrue(routerMock.didNavigateToWelcomeScreen)
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testInvalidEmail() {
    // Arrange
    emailValidatorMock.validationResult = .error(.invalid)
    passValidatorMock.validationResult = .valid
    let email = "invalid_email"
    let password = "securePassword"
    
    // Act
    presenter.onLoginButtonDidTap(email: email, password: password)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToWelcomeScreen)
    XCTAssertTrue(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testInvalidPassword() {
    // Arrange
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .error(.invalid)
    let email = "test@example.com"
    let password = "12345"
    
    // Act
    presenter.onLoginButtonDidTap(email: email, password: password)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToWelcomeScreen)
    XCTAssertTrue(routerMock.didMakeToast)
    XCTAssertFalse(routerMock.didNavigateToRegisterScreen)
  }
  
  func testRegisterLabelDidTap() {
    // Act
    presenter.onRegisterLabelDidTap()
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToWelcomeScreen)
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertTrue(routerMock.didNavigateToRegisterScreen)
  }
  
  func testPrimaryButtonNoticeDidTap() {
    // Act
    presenter.primaryButtonNoticeDidTap()
    
    // Assert
    XCTAssertTrue(routerMock.didNavigateToDashboardScreen)
  }
}

// Mock Classes

final class LoginViewMock: LoginViewProtocol {}

final class LoginRouterMock: LoginRouterProtocol {
  
  var didMakeToast = false
  var didNavigateToRegisterScreen = false
  var didNavigateToWelcomeScreen = false
  var didNavigateToDashboardScreen = false
  
  func makeToast(_ message: String) {
    didMakeToast = true
  }
  
  func navigateToWelcomeScreen(_ delegate: NoticeViewControllerDelegate) {
    didNavigateToWelcomeScreen = true
  }
  
  func navigateToDashboardScreen() {
    didNavigateToDashboardScreen = true
  }
  
  func navigateToRegisterScreen() {
    didNavigateToRegisterScreen = true
  }
}

final class EmailValidatorMock: EmailValidator {
  var validationResult: EmailValidationResult = .valid
  
  func validate(_ email: String?) -> EmailValidationResult {
    return validationResult
  }
}

final class PasswordValidatorMock: PasswordValidator {
  var validationResult: PasswordValidationResult = .valid
  
  func validate(_ password: String?) -> PasswordValidationResult {
    return validationResult
  }
}
