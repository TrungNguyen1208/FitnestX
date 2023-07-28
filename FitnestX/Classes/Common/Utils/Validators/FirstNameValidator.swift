//
//  FirstNameValidator.swift
//  FitnestX
//
//  Created by Tiến Ngô on 27/07/2023.
//

import Foundation

enum FirstNameValidationResult: Equatable {
  case valid
  case error(FirstNameValidationError)
}

enum FirstNameValidationError {
  case empty
  case invalid
}

protocol FirstNameValidator {
  func validate(_ firstName: String?) -> FirstNameValidationResult
}

final class FirstNameValidatorImpl: FirstNameValidator {
  
  // MARK: - Public
  
  func validate(_ firstName: String?) -> FirstNameValidationResult {
    guard let firstName = firstName, !firstName.isEmpty else {
      return .error(.empty)
    }
    if firstName.count < 6 {
      return .error(.invalid)
    }
    return .valid
  }
}
