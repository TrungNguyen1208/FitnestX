//
//  RegisterPresenterTest.swift
//  FitnestXTests
//
//  Created by Tien Ngo Xuan on 28/07/2023.
//

import XCTest
@testable import FitnestX

final class RegisterPresenterTest: XCTestCase {
  
  var presenter: RegisterPresenter!
  var viewMock: RegisterViewMock!
  var routerMock: RegisterRouterMock!
  var firstNameValidatorMock: FirstNameValidatorMock!
  var lastNameValidatorMock: LastNameValidatorMock!
  var emailValidatorMock: EmailValidatorMock!
  var passValidatorMock: PasswordValidatorMock!
  
  override func setUp() {
    super.setUp()
    viewMock = RegisterViewMock()
    routerMock = RegisterRouterMock()
    firstNameValidatorMock = FirstNameValidatorMock()
    lastNameValidatorMock = LastNameValidatorMock()
    emailValidatorMock = EmailValidatorMock()
    passValidatorMock = PasswordValidatorMock()
    
    presenter = RegisterPresenter()
    presenter.view = viewMock
    presenter.router = routerMock
    presenter.fistNameValidator = firstNameValidatorMock
    presenter.lastNameValidator = lastNameValidatorMock
    presenter.emailValidator = emailValidatorMock
    presenter.passValidator = passValidatorMock
  }
  
  override func tearDown() {
    presenter = nil
    viewMock = nil
    routerMock = nil
    firstNameValidatorMock = nil
    lastNameValidatorMock = nil
    emailValidatorMock = nil
    passValidatorMock = nil
    super.tearDown()
  }
  
  func testValidRegister() {
    // Arrange
    firstNameValidatorMock.validationResult = .valid
    lastNameValidatorMock.validationResult = .valid
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .valid
    let firstName = "firstName123"
    let lastName = "lastName"
    let email = "test@example.com"
    let password = "securePassword"
    let onCheckBox = true
    
    // Act
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: onCheckBox)
    
    // Assert
    XCTAssertTrue(routerMock.didNavigateToCompleteProfileScreen)
    XCTAssertFalse(routerMock.didMakeToast)
  }
  
  func testInvalidEmail() {
    // Arrange
    firstNameValidatorMock.validationResult = .valid
    lastNameValidatorMock.validationResult = .valid
    emailValidatorMock.validationResult = .error(.invalid)
    passValidatorMock.validationResult = .valid
    let firstName = "firstName123"
    let lastName = "lastName"
    let email = "texampcom"
    let password = "securePassword"
    let onCheckBox = true
    
    // Act
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: onCheckBox)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToCompleteProfileScreen)
    XCTAssertTrue(routerMock.didMakeToast)
  }
  
  func testInvalidFirstName() {
    // Arrange
    firstNameValidatorMock.validationResult = .error(.invalid)
    lastNameValidatorMock.validationResult = .valid
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .valid
    let firstName = "fir3"
    let lastName = "lastName"
    let email = "texa@mple.com"
    let password = "securePassword"
    let onCheckBox = true
    
    // Act
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: onCheckBox)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToCompleteProfileScreen)
    XCTAssertTrue(routerMock.didMakeToast)
  }
  
  func testInvalidLastName() {
    // Arrange
    firstNameValidatorMock.validationResult = .valid
    lastNameValidatorMock.validationResult = .error(.invalid)
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .valid
    let firstName = "fi222r3"
    let lastName = "las"
    let email = "texa@mple.com"
    let password = "securePassword"
    let onCheckBox = true
    
    // Act
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: onCheckBox)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToCompleteProfileScreen)
    XCTAssertTrue(routerMock.didMakeToast)
  }
  
  func testInvalidPassword() {
    // Arrange
    firstNameValidatorMock.validationResult = .valid
    lastNameValidatorMock.validationResult = .valid
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .error(.invalid)
    let firstName = "fi222r3"
    let lastName = "las"
    let email = "texa@mple.com"
    let password = "secu"
    let onCheckBox = true
    
    // Act
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: onCheckBox)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToCompleteProfileScreen)
    XCTAssertTrue(routerMock.didMakeToast)
  }
  
  func testInvalidCheckBox() {
    // Arrange
    firstNameValidatorMock.validationResult = .valid
    lastNameValidatorMock.validationResult = .valid
    emailValidatorMock.validationResult = .valid
    passValidatorMock.validationResult = .valid
    
    let firstName = "fi222r3"
    let lastName = "lassss"
    let email = "texa@mple.com"
    let password = "securePassword"
    let onCheckBox = false
    
    // Act
    presenter.onGetStartButtonDidTap(firstName: firstName, lastName: lastName, email: email, password: password, isCheckTerm: onCheckBox)
    
    // Assert
    XCTAssertFalse(routerMock.didNavigateToCompleteProfileScreen)
    XCTAssertTrue(routerMock.didMakeToast)
  }
  
  func testLoginLabelDidTap() {
    // Act
    presenter.onLoginLabelDidTap()
    
    // Assert
    XCTAssertFalse(routerMock.didMakeToast)
    XCTAssertTrue(routerMock.didNavigateToLoginScreen)
  }
}

// Mock Classes

final class RegisterViewMock: RegisterViewProtocol {}

final class RegisterRouterMock: RegisterRouterProtocol {
  
  var didMakeToast = false
  var didNavigateToCompleteProfileScreen = false
  var didNavigateToLoginScreen = false
  
  func makeToast(_ message: String) {
    didMakeToast = true
  }
  
  func navigateToCompleteProfileScreen() {
    didNavigateToCompleteProfileScreen = true
  }
  
  func popToLoginScreen() {
    didNavigateToLoginScreen = true
  }
}

final class FirstNameValidatorMock: FirstNameValidator {
  var validationResult: FirstNameValidationResult = .valid
  
  func validate(_ email: String?) -> FirstNameValidationResult {
    return validationResult
  }
}

final class LastNameValidatorMock: LastNameValidator {
  var validationResult: LastNameValidationResult = .valid
  
  func validate(_ lastName: String?) -> LastNameValidationResult {
    return validationResult
  }
}
