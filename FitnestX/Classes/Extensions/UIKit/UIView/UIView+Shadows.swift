import UIKit

extension UIView {
  
  /// A property that accesses the backing layer's shadow
  @IBInspectable
  open var shadowColor: UIColor? {
    get {
      guard let v = layer.shadowColor else {
        return nil
      }
      
      return UIColor(cgColor: v)
    }
    set(value) {
      layer.shadowColor = value?.cgColor
    }
  }
  
  /// A property that accesses the backing layer's shadowOffset.
  @IBInspectable
  open var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set(value) {
      layer.shadowOffset = value
    }
  }
  
  /// A property that accesses the backing layer's shadowOpacity.
  @IBInspectable
  open var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set(value) {
      layer.shadowOpacity = value
    }
  }
  
  /// A property that accesses the backing layer's shadowRadius.
  @IBInspectable
  open var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set(value) {
      layer.shadowRadius = value
    }
  }
  
  /// A property that accesses the backing layer's shadowPath.
  @IBInspectable
  open var shadowPath: CGPath? {
    get {
      return layer.shadowPath
    }
    set(value) {
      layer.shadowPath = value
    }
  }
  
  func addRoundShadow(_ radius: CGFloat, _ size: CGSize, _ shadowRadius: CGFloat, _ color: UIColor, _ opacity: CGFloat) {
    
    self.clipsToBounds = true
    
    layer.cornerRadius = radius
    layer.masksToBounds = false
    
    layer.shadowOffset = size
    layer.shadowColor = color.cgColor
    layer.shadowRadius = shadowRadius
    layer.shadowOpacity = Float(opacity)
    
    let backgroundCGColor = backgroundColor?.cgColor
    backgroundColor = nil
    layer.backgroundColor =  backgroundCGColor
    
  }
  
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    var rect = bounds
    
    // Increase height (only useful for the iPhone X for now)
    if #available(iOS 11.0, *) {
      if let window = UIApplication.shared.keyWindow {
        rect.size.height += window.safeAreaInsets.bottom
      }
    }
    
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
}
