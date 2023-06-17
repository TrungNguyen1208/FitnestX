//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

protocol ___VARIABLE_ModuleName___PresenterProtocol: AnyObject {
  var router: ___VARIABLE_ModuleName___RouterProtocol { get }
  
  init(view: ___VARIABLE_ModuleName___ViewProtocol, router: ___VARIABLE_ModuleName___RouterProtocol)
}

final class ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___PresenterProtocol {
  
  // MARK: - Private Variable
  
  private weak var view: ___VARIABLE_ModuleName___ViewProtocol?
  
  // MARK: - Public Variable
  
  public var router: ___VARIABLE_ModuleName___RouterProtocol
  
  // MARK: - Public function
  
  init(view: ___VARIABLE_ModuleName___ViewProtocol, router: ___VARIABLE_ModuleName___RouterProtocol) {
    self.view = view
    self.router = router
  }
}
