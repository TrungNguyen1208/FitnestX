import Foundation
import UIKit

extension UIView {
  func screenshot() -> UIImage! {
    let layer = self.layer
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
    layer.render(in: UIGraphicsGetCurrentContext()!)
    let screenshot = UIGraphicsGetImageFromCurrentImageContext()
    return screenshot
  }
}
