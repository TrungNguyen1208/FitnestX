import Foundation
import Swinject

final class ServicesAssembly {
  static let container: [Assembly] = {
    return [
      CommonServicesAssembly()
    ]
  }()
}
