import UIKit

public extension NSMutableAttributedString {

  func setLineHeight(_ lineHeight: CGFloat) {
    let stringAttributes = attributes(at: 0, effectiveRange: nil)
    let paragraphStyle = stringAttributes[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    paragraphStyle.minimumLineHeight = lineHeight

    let range = NSRange(location: 0, length: mutableString.length)
    addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
  }

  func setLetterSpacing(_ spacing: CGFloat) {
    let range = NSRange(location: 0, length: mutableString.length)
    addAttribute(NSAttributedString.Key.kern, value: spacing, range: range)
  }
}
