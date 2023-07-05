//
//  PasswordValidatorTests.swift
//  FitnestXTests
//
//  Created by Trung Nguyen on 05/07/2023.
//

import XCTest
@testable import FitnestX

final class PasswordValidatorTests: XCTestCase {
  
  var passwordValidator: PasswordValidator!
  
  override func setUp() {
    super.setUp()
    passwordValidator = PasswordValidatorImpl()
  }
  
  override func tearDown() {
    passwordValidator = nil
    super.tearDown()
  }
  
  func testValidPassword() {
    let result = passwordValidator.validate("securepassword")
    XCTAssertEqual(result, .valid)
  }
  
  func testEmptyPassword() {
    let result = passwordValidator.validate("")
    XCTAssertEqual(result, .error(.empty))
  }
  
  func testShortPassword() {
    let result = passwordValidator.validate("12345")
    XCTAssertEqual(result, .error(.invalid))
  }
  
  func testNilPassword() {
    let result = passwordValidator.validate(nil)
    XCTAssertEqual(result, .error(.empty))
  }
}
