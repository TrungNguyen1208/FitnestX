import UIKit

extension UIScrollView {
  func scrollToBottom(animated: Bool) {
    self.layoutIfNeeded()
    let y = contentSize.height - bounds.size.height + contentInset.bottom
    let bottomOffset = CGPoint(x: 0,
                               y: max(0, y))
    setContentOffset(bottomOffset, animated: animated)
  }
  
  func scrollToTop() {
      let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
      setContentOffset(desiredOffset, animated: true)
 }
  
}
