import Foundation

public extension String {

  internal var defaultStorage: DefaultsStorage {
    return DefaultsStorageImpl.shared
  }
  
  func localized() -> String {
    return localized(using: nil, in: .main)
  }
  
  func localizedFormat(_ arguments: CVarArg...) -> String {
    return String(format: localized(), arguments: arguments)
  }
  
  func pluralizedFormat(_ arguments: CVarArg...) -> String {
    return withVaList(arguments) {
      NSString(format: localized(), locale: NSLocale.current, arguments: $0) as String
    }
  }
  
  func localized(using tableName: String?) -> String {
    return localized(using: tableName, in: .main)
  }
  
  func localized(in bundle: Bundle?) -> String {
    return localized(using: nil, in: bundle)
  }

  func localized(using tableName: String?, in bundle: Bundle?) -> String {
    let bundle: Bundle = bundle ?? .main

    let selectedLanguage = defaultStorage.currentLanguage != nil ? defaultStorage.currentLanguage! : "en"
    if let path = bundle.path(forResource: selectedLanguage, ofType: "lproj"), let bundle = Bundle(path: path) {
      return bundle.localizedString(forKey: self, value: nil, table: tableName)
    }
    return self
  }
}
