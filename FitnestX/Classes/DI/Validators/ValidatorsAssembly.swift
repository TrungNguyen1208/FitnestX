import Foundation
import Swinject

final class ValidatorsAssembly: Assembly {
  func assemble(container: Container) {
    registerEmailValidator(in: container)
    registerPasswordValidator(in: container)
    registerFirstNameValidator(in: container)
    registerLastNameValidator(in: container)
  }
}

private extension ValidatorsAssembly {
  func registerEmailValidator(in container: Container) {
    container.register(EmailValidator.self) { _ in
      EmailValidatorImpl()
    }
  }
  
  func registerPasswordValidator(in container: Container) {
    container.register(PasswordValidator.self) { _ in
      PasswordValidatorImpl()
    }
  }
  
  func registerFirstNameValidator(in container: Container) {
    container.register(FirstNameValidator.self) { _ in
      FirstNameValidatorImpl()
    }
  }
  
  func registerLastNameValidator(in container: Container) {
    container.register(LastNameValidator.self) { _ in
      LastNameValidatorImpl()
    }
  }
}
