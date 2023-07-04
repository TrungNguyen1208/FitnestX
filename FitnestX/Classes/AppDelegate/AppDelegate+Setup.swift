import Foundation
import IQKeyboardManagerSwift

extension AppDelegate {
  func setupAppearance() {
    setupIQKeyboard()
    setupToastView()
  }
}

private extension AppDelegate {
  func setupIQKeyboard() {
    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.enableAutoToolbar = true
    IQKeyboardManager.shared.toolbarDoneBarButtonItemText = R.string.localizable.common_done.localized()
  }
  
  func setupToastView() {
    var style = ToastStyle()
    style.messageFont = R.font.poppinsMedium(size: 15)!
    style.messageAlignment = .center
    style.titleAlignment = .center
    style.horizontalPadding = 15.0
    style.verticalPadding = 10.0
    ToastManager.shared.style = style
    ToastManager.shared.duration = 2.0
  }
}
