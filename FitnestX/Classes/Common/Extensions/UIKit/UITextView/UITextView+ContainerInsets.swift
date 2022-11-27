import UIKit

extension UITextView {
  @IBInspectable var containerInsetLeft: CGFloat {
    get {
      return textContainerInset.left
    }
    set {
      textContainerInset.left = newValue
    }
  }
  
  @IBInspectable var containerInsetRight: CGFloat {
    get {
      return textContainerInset.right
    }
    set {
      textContainerInset.right = newValue
    }
  }
  
  @IBInspectable var containerInsetTop: CGFloat {
    get {
      return textContainerInset.top
    }
    set {
      textContainerInset.top = newValue
    }
  }
  
  @IBInspectable var containerInsetBottom: CGFloat {
    get {
      return textContainerInset.bottom
    }
    set {
      textContainerInset.bottom = newValue
    }
  }
  
  @IBInspectable var lineFragmentPadding: CGFloat {
    get {
      return textContainer.lineFragmentPadding
    }
    set {
      textContainer.lineFragmentPadding = newValue
    }
  }
}
