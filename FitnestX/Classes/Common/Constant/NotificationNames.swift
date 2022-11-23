import Foundation
import UIKit

struct ApplicationNotifications {
  static let didBecomeActive = UIApplication.didBecomeActiveNotification
  static let willResignActive = UIApplication.willResignActiveNotification
}

struct SessionNotifications {
  static let sessionExpired = Notification.Name(rawValue: "SessionExpired")
  static let sessionDestroyed = Notification.Name(rawValue: "SessionDestroyed") // Case delete account
}

struct AccountNotifications {
  static let authorizationCompleted = Notification.Name(rawValue: "AccountAuthorizationCompleted")
  static let accountLoggedOut = Notification.Name(rawValue: "AccountLoggedOut")
}

struct LocalizationNotification {
  static let didChange = Notification.Name(rawValue: "LocalizationDidChange")
}
