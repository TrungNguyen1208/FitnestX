import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
  final class func create<T: UIViewController>(_: T.Type, container: Container) -> SwinjectStoryboard {
    let name = String(describing: type(of: T.self)).components(separatedBy: ".").first!
    return SwinjectStoryboard.create(name: name,
                                     bundle: nil,
                                     container: container)
  }
  
  final class func create<T: UIViewController>(_: T.Type) -> SwinjectStoryboard {
    let container = AppAssembly.current.resolver as! Container
    return create(T.self, container: container)
  }
}
