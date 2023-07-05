import Foundation
import UIKit

struct RegisterLabelURL {
  static let registerLinkAction = "action://register"
}

final class RegisterLabel: TTTAttributedLabel {
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
    
    let login = "Register"
    let fullText = String(format: "Don’t have an account yet? %@", login)

    let textAttributes: [NSAttributedString.Key: Any] = [
      .font: R.font.poppinsRegular(size: 14)!,
      .foregroundColor: UIColor.black
    ]
    let attributedString = NSAttributedString(string: fullText,
                                              attributes: textAttributes)
    text = attributedString
    
    let registerLink = URL(string: RegisterLabelURL.registerLinkAction)
    addLink(to: registerLink, with: NSRange(fullText.range(of: login)!, in: fullText))
  }
}
