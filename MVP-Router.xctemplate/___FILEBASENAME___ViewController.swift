//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

protocol ___VARIABLE_ModuleName___ViewProtocol: AnyObject {
    
}

final class ___VARIABLE_ModuleName___ViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  // MARK: - Public Variable
  
  public var presenter: ___VARIABLE_ModuleName___PresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
}

// MARK: - Private

private extension ___VARIABLE_ModuleName___ViewController {
  func setupUI() {
    
  }
}

// MARK: - ___VARIABLE_ModuleName___ViewControllerProtocol

extension ___VARIABLE_ModuleName___ViewController: ___VARIABLE_ModuleName___ViewProtocol {
  
}
