//
//  EmailValidatorTests.swift
//  FitnestXTests
//
//  Created by Trung Nguyen on 05/07/2023.
//

import XCTest
@testable import FitnestX

final class EmailValidatorTests: XCTestCase {
  
  var emailValidator: EmailValidator!
  
  override func setUp() {
    super.setUp()
    emailValidator = EmailValidatorImpl()
  }
  
  override func tearDown() {
    emailValidator = nil
    super.tearDown()
  }
  
  func testValidEmail() {
    let result = emailValidator.validate("test@example.com")
    XCTAssertEqual(result, .valid)
  }
  
  func testEmptyEmail() {
    let result = emailValidator.validate("")
    XCTAssertEqual(result, .error(.empty))
  }
  
  func testInvalidEmail() {
    let result = emailValidator.validate("invalid_email")
    XCTAssertEqual(result, .error(.invalid))
  }
  
  func testNilEmail() {
    let result = emailValidator.validate(nil)
    XCTAssertEqual(result, .error(.empty))
  }
}
