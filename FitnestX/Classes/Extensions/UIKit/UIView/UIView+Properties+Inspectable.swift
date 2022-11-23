import UIKit

extension UIView {
  
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }
  
  @IBInspectable var masksToBounds: Bool {
    get {
      return layer.masksToBounds
    }
    set {
      layer.masksToBounds = newValue
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
  
}
