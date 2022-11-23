import Foundation
import UIKit

extension UIView {
  
  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.topAnchor
    } else {
      return topAnchor
    }
  }
  
  var safeLeftAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.leftAnchor
    } else {
      return self.leftAnchor
    }
  }
  
  var safeRightAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.rightAnchor
    } else {
      return rightAnchor
    }
  }
  
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.bottomAnchor
    } else {
      return bottomAnchor
    }
  }
}
