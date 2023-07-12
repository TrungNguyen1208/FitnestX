import Foundation
import Swinject

final class FormattersAssembly: Assembly {
  func assemble(container: Container) {
    registerNumbersFormatter(in: container)
  }
}

private extension FormattersAssembly {
  func registerNumbersFormatter(in container: Container) {

  }
}
