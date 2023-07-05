import Foundation

enum PasswordValidationResult: Equatable {
  case valid
  case error(PasswordValidationError)
}

enum PasswordValidationError {
  case empty
  case invalid
}

protocol PasswordValidator {
  func validate(_ password: String?) -> PasswordValidationResult
}

final class PasswordValidatorImpl: PasswordValidator {
  
  // MARK: - Public
  
  func validate(_ password: String?) -> PasswordValidationResult {
    guard let password = password, !password.isEmpty else {
      return .error(.empty)
    }
    if password.count < 6 {
      return .error(.invalid)
    }
    return .valid
  }
}
