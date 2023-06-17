//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

protocol ___VARIABLE_ModuleName___RouterProtocol {
  init(view: ___VARIABLE_ModuleName___ViewController)
}

final class ___VARIABLE_ModuleName___Router: ___VARIABLE_ModuleName___RouterProtocol {
  
  private weak var view: ___VARIABLE_ModuleName___ViewController?

  init(view: ___VARIABLE_ModuleName___ViewController) {
    self.view = view
  }
}
