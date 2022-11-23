import UIKit

extension UIView {
    // Returns UIView for chaining
    @discardableResult func fadeIn(duration: TimeInterval = 0.3,
                                   delay: TimeInterval = 0,
                                   completion: ((Bool) -> Void)? = nil) -> UIView {
        isHidden = false
        alpha = 0
        UIView.animate(
            withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
                self.alpha = 1
        }, completion: completion)
        return self
    }
    
    @discardableResult func fadeOut(duration: TimeInterval = 0.3,
                                    delay: TimeInterval = 0,
                                    completion: ((Bool) -> Void)? = nil) -> UIView {
        UIView.animate(
            withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
                self.alpha = 0
        }, completion: completion)
        return self
    }
}
