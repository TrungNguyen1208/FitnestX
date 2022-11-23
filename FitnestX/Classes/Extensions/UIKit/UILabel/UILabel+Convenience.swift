import UIKit

public extension UILabel {

  var isMultiLine: Bool {
    let maxSize = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
    if let textSize = text?.boundingRect(with: maxSize,
                                         options: .usesLineFragmentOrigin,
                                         attributes: [NSAttributedString.Key.font: font!],
                                         context: nil) {
      let numberOfLine = Int(ceil(textSize.height/font.lineHeight))
      return numberOfLine > 1
    }
    return false
  }

  // once attributedText has been set to nil, all predefined attributes will gone
  // hideIfNil comes conveniently using isHidden instead
  func setAttributedText(from text: String?, lineHeight: CGFloat? = nil, spacing: CGFloat? = nil, hideIfNil: Bool = false) {
    if let text = text, !text.isEmpty {
      if hideIfNil { isHidden = false }
      let attributes = attributedText?.attributes(at: 0, effectiveRange: nil)
      let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
      if let lineHeight = lineHeight {
        attributedString.setLineHeight(lineHeight)
      }
      if let spacing = spacing {
        attributedString.setLetterSpacing(spacing)
      }
      attributedText = attributedString
    } else {
      if hideIfNil {
        isHidden = true
      } else {
        attributedText = nil
      }
    }
    invalidateIntrinsicContentSize()
  }
  
  func getLinesFromLabel(_ labelWidth: CGFloat) -> [String] {
    guard let text = self.text as NSString? else { return [] }

    let ctFont = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
    let attStr: NSMutableAttributedString = NSMutableAttributedString(string: text as String)
    attStr.addAttribute(NSAttributedString.Key(rawValue: String(kCTFontAttributeName)), value: ctFont, range: NSRange(location: 0, length: attStr.length))
    let frameSetter: CTFramesetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
    let path: CGMutablePath = CGMutablePath()
    path.addRect(CGRect(x: 0, y: 0, width: labelWidth, height: CGFloat.greatestFiniteMagnitude))
    
    let frame: CTFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
    let lines = CTFrameGetLines(frame) as NSArray
    
    return lines.map {
      let lineRange = CTLineGetStringRange($0 as! CTLine)
      let range = NSRange(location: lineRange.location, length: lineRange.length)
      return text.substring(with: range) as String
    }
  }
}
