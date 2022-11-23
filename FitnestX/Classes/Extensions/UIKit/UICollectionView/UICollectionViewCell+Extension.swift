import UIKit

extension UICollectionViewCell {
  class func nib() -> UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  class func nibName() -> String {
    return String(describing: self)
  }
}
