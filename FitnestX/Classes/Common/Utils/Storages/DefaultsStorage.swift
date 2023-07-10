import Foundation

protocol DefaultsStorage {
  var currentLanguage: String? { get set }
  
  func cleanUpData()
}

final class DefaultsStorageImpl: DefaultsStorage {
  
  // MARK: - Init
  
  init(userDefaultsProvider: UserDefaultsProvider = UserDefaults.standard) {
    defaults = userDefaultsProvider
  }

  // MARK: - Private Variables

  private let defaults: UserDefaultsProvider

  // MARK: - Public Variables

  var currentLanguage: String? {
    get {
      return defaults.string(forKey: DefaultsStorageKeys.currentLanguageKey)
    }
    set {
      defaults.set(newValue, forKey: DefaultsStorageKeys.currentLanguageKey)
    }
  }
  
  func cleanUpData() {

  }
}
