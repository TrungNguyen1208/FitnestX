import Foundation
import UIKit

extension UITextField {
  func updateCursorPosition(_ cursorPosition: Int) {
    if let newPosition = position(from: beginningOfDocument, offset: cursorPosition) {
      selectedTextRange = textRange(from: newPosition, to: newPosition)
    }
  }
  
  func moveCursorPositionToTheEnd() {
    if let text = text {
      updateCursorPosition(text.count)
    }
  }
  
  func cursorPosition() -> Int? {
    if let selectedRange = selectedTextRange {
      return offset(from: beginningOfDocument, to: selectedRange.start)
    }
    return nil
  }
}

private var maxLengths = [UITextField: Int]()

extension UITextField {
  
  @IBInspectable var maxLength: Int {
    get {
      guard let length = maxLengths[self] else {
        return Int.max
      }
      return length
    }
    set {
      maxLengths[self] = newValue
      addTarget(
        self,
        action: #selector(limitLength),
        for: UIControl.Event.editingChanged
      )
    }
  }
  
  @objc func limitLength(textField: UITextField) {
    guard let prospectiveText = textField.text, prospectiveText.count > maxLength else {
      return
    }
    text = String(prospectiveText.prefix(maxLength))
  }
}

extension UITextField {
  
  @IBInspectable var paddingLeftCustom: CGFloat {
    get {
      return leftView!.frame.size.width
    }
    set {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
      leftView = paddingView
      leftViewMode = .always
    }
  }
  
  @IBInspectable var paddingRightCustom: CGFloat {
    get {
      return rightView!.frame.size.width
    }
    set {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
      rightView = paddingView
      rightViewMode = .always
    }
  }
}
