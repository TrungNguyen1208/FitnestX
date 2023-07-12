import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
  func instantiate<T: UIViewController>(_: T.Type) -> T {
    let container = AppAssembly.current.resolver as! Container
    return instantiate(T.self, container: container)
  }
  
   func instantiate<T: UIViewController>(_: T.Type, container: Container) -> T {
    let storyBoard = SwinjectStoryboard.create(T.self, container: container)
    let id = String(describing: type(of: T.self)).components(separatedBy: ".").first!
    let controller = storyBoard.instantiateViewController(withIdentifier: id) as! T
    return controller
  }
}

extension UIViewController {
  static func makeMe() -> Self {
    let storyBoard = SwinjectStoryboard.create(Self.self)
    let controller = storyBoard.instantiate(Self.self)
    return controller
  }
}
