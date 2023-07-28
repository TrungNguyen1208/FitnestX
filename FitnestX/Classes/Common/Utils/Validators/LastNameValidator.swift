//
//  LastNameValidator.swift
//  FitnestX
//
//  Created by Tiến Ngô on 27/07/2023.
//

import Foundation

enum LastNameValidationResult: Equatable {
  case valid
  case error(LastNameValidationError)
}

enum LastNameValidationError {
  case empty
  case invalid
}

protocol LastNameValidator {
  func validate(_ lastName: String?) -> LastNameValidationResult
}

final class LastNameValidatorImpl: LastNameValidator {
  
  // MARK: - Public
  
  func validate(_ lastName: String?) -> LastNameValidationResult {
    guard let lastName = lastName, !lastName.isEmpty else {
      return .error(.empty)
    }
    if lastName.count < 6 {
      return .error(.invalid)
    }
    return .valid
  }
}
