import Foundation
import UIKit

extension UIApplication {
  static func openURL(_ url: URL?) {
    if let url = url, shared.canOpenURL(url) {
      if #available(iOS 10, *) {
        shared.open(url)
      } else {
        shared.openURL(url)
      }
    }
  }
  
  static func canOpenURL(_ url: URL) -> Bool {
    return shared.canOpenURL(url)
  }

  static func openSettings() {
    UIApplication.openURL(URL(string: UIApplication.openSettingsURLString))
  }

  static func makeCall(with phone: String) {
    if let url = URL(string: "tel://\(phone)") {
      openURL(url)
    }
  }
  
  static func openEMail(_ email: String) {
    if let url = URL(string: "mailto:\(email)") {
      openURL(url)
    }
  }
}
