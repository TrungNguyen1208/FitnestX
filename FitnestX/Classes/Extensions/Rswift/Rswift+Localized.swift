import Foundation
import Rswift

extension StringResourceType {
  func localized() -> String {
    return key.localized()
  }
    
  func localizedFormat(_ arguments: CVarArg...) -> String {
    return key.localizedFormat(arguments)
  }
}
