import Foundation
import Swinject

final class ValidatorsAssembly: Assembly {
  func assemble(container: Container) {
    registerEmailValidator(in: container)
    registerPasswordValidator(in: container)
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
}
