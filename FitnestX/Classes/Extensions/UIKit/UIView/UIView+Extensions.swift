import UIKit

extension UIStackView {
  func addBackground(color: UIColor, cornerRadius: CGFloat = 0) {
    let subview = UIView(frame: bounds)
    subview.cornerRadius = cornerRadius
    subview.backgroundColor = color
    subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    insertSubview(subview, at: 0)
  }
}
