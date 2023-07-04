import Foundation
import UIKit

@IBDesignable
class FitnestPasswordTextField: FitnestTextField {
  
  let rightButton  = UIButton(type: .custom)
  
  private var textPadding: UIEdgeInsets {
    let p: CGFloat = leftPadding + gapPadding + (leftView?.frame.width ?? 0)
    return UIEdgeInsets(top: 0, left: p, bottom: 0, right: leftPadding + 32)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  required override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.width - 32, y: bounds.midY - 16, width: 32, height: 32)
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
}

private extension FitnestPasswordTextField {
  func commonInit() {
    rightButton.setImage(UIImage(named: "password_show") , for: .normal)
    rightButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    rightButton.imageView?.contentMode = .scaleAspectFit
    rightButton.imageEdgeInsets = UIEdgeInsets(top: 3.0, left: 3.0, bottom: 3.0, right: 9.0)
    rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
    rightButton.translatesAutoresizingMaskIntoConstraints = false
    
    rightViewMode = .always
    rightView = rightButton
    isSecureTextEntry = true
    
    self.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
  
  @objc func toggleShowHide(button: UIButton) {
    toggle()
  }
  
  @objc func textDidChange() {
    if text.orEmpty.isEmpty {
      rightButton.setImage(UIImage(named: "password_show") , for: .normal)
    } else if isSecureTextEntry {
      rightButton.setImage(UIImage(named: "password_show") , for: .normal)
    } else {
      rightButton.setImage(UIImage(named: "password_hide") , for: .normal)
    }
  }
  
  func toggle() {
    if text.orEmpty.isEmpty {
      return
    }
    isSecureTextEntry.toggle()
    if isSecureTextEntry {
      rightButton.setImage(UIImage(named: "password_show") , for: .normal)
    } else {
      rightButton.setImage(UIImage(named: "password_hide") , for: .normal)
    }
  }
}
