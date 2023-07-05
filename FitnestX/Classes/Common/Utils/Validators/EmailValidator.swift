import Foundation

enum EmailValidationResult: Equatable {
  case valid
  case error(EmailValidationError)
}

enum EmailValidationError {
  case empty
  case invalid
}

protocol EmailValidator {
  func validate(_ email: String?) -> EmailValidationResult
}

final class EmailValidatorImpl: EmailValidator {
  
  // MARK: - Public
  
  func validate(_ email: String?) -> EmailValidationResult {
    guard let email = email else {
      return .error(.empty)
    }
    let emailRegex = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
    let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
    return emailPredicate.evaluate(with: email) ? .valid : .error(.invalid)
  }
}
