import UIKit

extension UITableViewCell {
  class func nib() -> UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  class func nibName() -> String {
    return String(describing: self)
  }
}

extension UITableViewHeaderFooterView {
  class func nib() -> UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  class func nibName() -> String {
    return String(describing: self)
  }
}

extension UITableView {
  func register<T: UITableViewCell>(_ aClass: T.Type) {
    let name = String(describing: aClass)
    let bundle = Bundle.main
    if bundle.path(forResource: name, ofType: "nib") != nil {
      let nib = UINib(nibName: name, bundle: bundle)
      register(nib, forCellReuseIdentifier: name)
    } else {
      register(aClass, forCellReuseIdentifier: name)
    }
  }
  
  func dequeue<T: UITableViewCell>(_ aClass: T.Type) -> T {
    let name = String(describing: aClass)
    guard let cell = dequeueReusableCell(withIdentifier: name) as? T else {
      fatalError("`\(name)` is not registed")
    }
    return cell
  }
}
