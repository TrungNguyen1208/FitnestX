import Foundation
import UIKit

@IBDesignable
class FitnestTextField: UITextField {
  
  @IBInspectable var leftImage: UIImage? = nil
  @IBInspectable var leftPadding: CGFloat = 15
  @IBInspectable var gapPadding: CGFloat = 0
  
  @IBInspectable var placeholderColor : UIColor? {
    didSet {
      let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
      let str = NSAttributedString(string: rawString, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor!])
      attributedPlaceholder = str
    }
  }
  
  private var textPadding: UIEdgeInsets {
    let p: CGFloat = leftPadding + gapPadding + (leftView?.frame.width ?? 0)
    return UIEdgeInsets(top: 0, left: p, bottom: 0, right: leftPadding)
  }
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: textPadding)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: textPadding)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: textPadding)
  }
  
  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    var r = super.leftViewRect(forBounds: bounds)
    r.origin.x += leftPadding
    return r
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setup()
  }
}

private extension FitnestTextField {
  func setup() {
    if let image = leftImage {
      if leftView != nil { return }
      
      let im = UIImageView(frame: CGRect(x: 0, y: 15, width: 18, height: 18))
      im.contentMode = .scaleAspectFit
      im.image = image
      
      leftViewMode = UITextField.ViewMode.always
      leftView = im
    } else {
      leftViewMode = UITextField.ViewMode.never
      leftView = nil
    }
    
    font = R.font.poppinsRegular(size: 12)
    backgroundColor = R.color.borderF7F8F8()
    placeholderColor = R.color.grayADA4A5()
    textColor = R.color.grayADA4A5()
    borderStyle = .none
    cornerRadius = 14
  }
}
