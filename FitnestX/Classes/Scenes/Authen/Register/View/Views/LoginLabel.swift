import Foundation
import UIKit

struct LoginLabelURL {
  static let loginLinkAction = "action://login"
}

final class LoginLabel: TTTAttributedLabel {
  // MARK: - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    numberOfLines = 0
    
    let linkAttributes: [NSAttributedString.Key: Any] = [
      .font: R.font.poppinsRegular(size: 14)!,
      .foregroundColor: R.color.purpleEEA4CE()!
    ]
    self.linkAttributes = linkAttributes
    self.activeLinkAttributes = linkAttributes
    
    let login = "Login"
    let fullText = String(format: "Already have an account? %@", login)

    let textAttributes: [NSAttributedString.Key: Any] = [
      .font: R.font.poppinsRegular(size: 14)!,
      .foregroundColor: UIColor.black
    ]
    let attributedString = NSAttributedString(string: fullText,
                                              attributes: textAttributes)
    text = attributedString
    
    let loginLink = URL(string: LoginLabelURL.loginLinkAction)
    addLink(to: loginLink, with: NSRange(fullText.range(of: login)!, in: fullText))
  }
}
