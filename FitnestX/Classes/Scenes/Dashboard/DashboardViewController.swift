//
//  DashboardViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 17/06/2023.
//  
//

import UIKit

protocol DashboardViewProtocol: AnyObject {
    
}

final class DashboardViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  // MARK: - Public Variable
  
  public var presenter: DashboardPresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
}

// MARK: - Private

private extension DashboardViewController {
  func setupUI() {
    
  }
}

// MARK: - DashboardViewControllerProtocol

extension DashboardViewController: DashboardViewProtocol {
  
}
