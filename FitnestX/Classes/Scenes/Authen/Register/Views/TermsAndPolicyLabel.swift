import UIKit

struct TermsAndPolicyLabelURL {
  static let termsLinkAction = "action://terms"
  static let privacyPolicyLinkAction = "action://pp"
}

final class TermsAndPolicyLabel: TTTAttributedLabel {
  
  // MARK: - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    numberOfLines = 0
    
    let linkAttributes: [NSAttributedString.Key: Any] = [
      .font: R.font.poppinsRegular(size: 10)!,
      .foregroundColor: R.color.grayADA4A5()!,
      .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    self.linkAttributes = linkAttributes
    self.activeLinkAttributes = linkAttributes
    
    let terms = "Term of Use"
    let privacyPolicy = "Privacy Policy"
    let fullText = String(format: "By continuing you accept our %@ and %@", privacyPolicy, terms)

    let textAttributes: [NSAttributedString.Key: Any] = [
      .font: R.font.poppinsRegular(size: 10)!,
      .foregroundColor: R.color.grayADA4A5()!
    ]
    let attributedString = NSAttributedString(string: fullText,
                                              attributes: textAttributes)
    text = attributedString
    
    let termsLink = URL(string: TermsAndPolicyLabelURL.termsLinkAction)
    addLink(to: termsLink, with: NSRange(fullText.range(of: terms)!, in: fullText))
    
    let ppLink = URL(string: TermsAndPolicyLabelURL.privacyPolicyLinkAction)
    addLink(to: ppLink, with: NSRange(fullText.range(of: privacyPolicy)!, in: fullText))
  }
}
