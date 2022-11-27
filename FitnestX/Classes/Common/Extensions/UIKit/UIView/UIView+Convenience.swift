import Foundation
import UIKit

// MARK: - Rounded Corners

extension UIView {
  func roundedCorners(radius: CGFloat? = nil) {
    layoutIfNeeded()
    layer.cornerRadius = radius != nil ? radius! : ceil(frame.height / 2)
    layer.masksToBounds = true
  }
  
  func roundedCorners(corners: UIRectCorner, radius: Int = 8) {
    let maskPath = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
    let maskLayer = CAShapeLayer()
    maskLayer.path = maskPath.cgPath
    layer.mask = maskLayer
    layer.masksToBounds = true
  }
}

// MARK: - Nib

extension UIView {
  static var nib: UINib {
    let bundle = Bundle(for: self as AnyClass)
    let nib = UINib(nibName: String(describing: self), bundle: bundle)
    return nib
  }
  
  static func loadFromNib() -> Self {
    return _loadFromNib()
  }
  
  // MARK: - Private
  
  fileprivate static func _loadFromNib<T: UIView>() -> T {
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? T else {
      fatalError("The nib \(nib) expected its root view to be of type \(self)")
    }
    return view
  }
}

// MARK: - Subviews

extension UIView {
  final class func recursiveSubviews<T: UIView>(view: UIView) -> [T] {
    return view.subviews.flatMap { subView -> [T] in
      var result = recursiveSubviews(view: subView) as [T]
      if let view = subView as? T {
        result.append(view)
      }
      return result
    }
  }
  
  func recursiveSubviews<T: UIView>() -> [T] {
    return UIView.recursiveSubviews(view: self) as [T]
  }
  
  func removeAllSubviews() {
    for subview in subviews {
      subview.removeFromSuperview()
    }
  }
}

// MARK: - Layout

extension UIView {
  @discardableResult
  func pinViewToEdgesOfSuperview(offset: UIEdgeInsets = UIEdgeInsets.zero) -> (bottomConstraint: NSLayoutConstraint, topConstraint: NSLayoutConstraint) {
    translatesAutoresizingMaskIntoConstraints = false
    
    let bottomConstraint = superview!.bottomAnchor.constraint(equalTo: bottomAnchor, constant: offset.bottom)
    let topConstraint = superview!.topAnchor.constraint(equalTo: topAnchor, constant: offset.top)
    let leadingConstraint = superview!.leftAnchor.constraint(equalTo: leftAnchor, constant: offset.left)
    let trailingConstraint = superview!.rightAnchor.constraint(equalTo: rightAnchor, constant: offset.right)
    superview!.addConstraints([bottomConstraint, topConstraint, leadingConstraint, trailingConstraint])
    
    return (bottomConstraint, topConstraint)
  }
  
  func pinViewToCenterOfSuperview(offsetX: CGFloat = 0.0, offsetY: CGFloat = 0.0) {
    translatesAutoresizingMaskIntoConstraints = false
    superview!.addConstraints([
      centerXAnchor.constraint(equalTo: superview!.centerXAnchor, constant: offsetX),
      centerYAnchor.constraint(equalTo: superview!.centerYAnchor, constant: offsetY)
    ])
  }
  
  func pinViewWidthAndHeight(width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    superview!.addConstraints([
      widthAnchor.constraint(equalToConstant: width),
      heightAnchor.constraint(equalToConstant: height)
    ])
  }
  
  @discardableResult
  func pinViewToBottomOfSuperview(height: CGFloat) -> (bottomConstarint: NSLayoutConstraint, heightConstarint: NSLayoutConstraint) {
    translatesAutoresizingMaskIntoConstraints = false
    let bottomConstraint = superview!.bottomAnchor.constraint(equalTo: bottomAnchor)
    let heightConstarint = heightAnchor.constraint(equalToConstant: height)
    superview!.addConstraints([
      heightConstarint,
      superview!.leftAnchor.constraint(equalTo: leftAnchor),
      superview!.rightAnchor.constraint(equalTo: rightAnchor),
      bottomConstraint
    ])
    return (bottomConstraint, heightConstarint)
  }
  
  func setViewToEdgesOfSuperview(leftOffset: CGFloat = 0, rightOffset: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    superview!.addConstraints([
      superview!.leftAnchor.constraint(equalTo: leftAnchor, constant: leftOffset),
      superview!.rightAnchor.constraint(equalTo: rightAnchor, constant: rightOffset)
    ])
  }
  
  func pinViewToBottomOfSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    superview!.addConstraints([
      superview!.leftAnchor.constraint(equalTo: leftAnchor),
      superview!.rightAnchor.constraint(equalTo: rightAnchor),
      superview!.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func pinViewToTopOfSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    superview!.addConstraints([
      superview!.leftAnchor.constraint(equalTo: leftAnchor),
      superview!.rightAnchor.constraint(equalTo: rightAnchor),
      superview!.topAnchor.constraint(equalTo: topAnchor)
    ])
  }
}

// MARK: - Presenting

extension UIView {
  func hideView(_ hide: Bool, animated: Bool) {
    guard hide != isHidden else { return }
    if animated {
      if !hide {
        alpha = 0
        isHidden = false
      }
      UIView.animate(withDuration: 0.3,
                     animations: { [weak self] in self?.alpha = hide ? 0 : 1 },
                     completion: { [weak self] completed in
                      guard completed, hide else { return }
                      self?.isHidden = true
                     })
    } else {
      isHidden = hide
      alpha = hide ? 0 : 1
    }
  }
}

extension UIView {
  public func preventRepeatedPresses(inNext seconds: Double = 0.75) {
    if !self.isUserInteractionEnabled { return }
    self.isUserInteractionEnabled = false
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) { [weak self] in
      self?.isUserInteractionEnabled = true
    }
  }
}
