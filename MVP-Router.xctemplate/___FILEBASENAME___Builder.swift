//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

final class ___VARIABLE_ModuleName___Builder {
  
  public static func build() -> ___VARIABLE_ModuleName___ViewController {
    let view = ___VARIABLE_ModuleName___ViewController.makeMe()
    let router = ___VARIABLE_ModuleName___Router(view: view)
    let presenter = ___VARIABLE_ModuleName___Presenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
  
}
