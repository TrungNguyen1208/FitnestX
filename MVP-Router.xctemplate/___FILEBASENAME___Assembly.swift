//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import Swinject
import SwinjectStoryboard

final class ___VARIABLE_ModuleName___Assembly: Assembly {
  func assemble(container: Container) {
    container.register(___VARIABLE_ModuleName___Router.self) { (_, viewController: ___VARIABLE_ModuleName___ViewController) in
      let router = ___VARIABLE_ModuleName___Router()
      router.view = viewController
      return router
    }
    
    container.register(___VARIABLE_ModuleName___Presenter.self) { (r, viewController: ___VARIABLE_ModuleName___ViewController) in
      let presenter = ___VARIABLE_ModuleName___Presenter()
      presenter.view = viewController
      presenter.router = r.resolve(___VARIABLE_ModuleName___Router.self, argument: viewController)
      return presenter
    }
    
    container.storyboardInitCompleted(___VARIABLE_ModuleName___ViewController.self) { (r, viewController) in
      viewController.presenter = r.resolve(___VARIABLE_ModuleName___Presenter.self, argument: viewController)
    }
  }
}
