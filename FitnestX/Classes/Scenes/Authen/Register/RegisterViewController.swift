//
//  RegisterViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 26/11/2022.
//  
//

import UIKit

final class RegisterViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var termCheckBox: BEMCheckBox!
  
  // MARK: - Private Variable
  
  private lazy var presenter: RegisterPresenter = {
    let presenter = RegisterPresenter()
    presenter.view = self
    return presenter
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func startButtonDidTap() {
    let vc = CompleteProfileViewController.makeMe()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension RegisterViewController {
  func setupUI() {
    termCheckBox.boxType = .square
  }
}

// MARK: - RegisterViewInput

extension RegisterViewController: RegisterViewInput {
  
}
