//
//  RegisterViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 04/07/2023.
//  
//

import UIKit

protocol RegisterViewProtocol: AnyObject {
    
}

final class RegisterViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var termCheckBox: BEMCheckBox!
  @IBOutlet private weak var loginLabel: LoginLabel!
  
  // MARK: - Public Variable
  
  public var presenter: RegisterPresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  @IBAction private func startButtonDidTap() {
    let vc = CompleteProfileViewController.makeMe()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension RegisterViewController {
  func setupUI() {
    termCheckBox.boxType = .square
    loginLabel.delegate = self
  }
}

// MARK: - TTTAttributedLabelDelegate

extension RegisterViewController: TTTAttributedLabelDelegate {
  func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
    switch url.absoluteString {
    case LoginLabelURL.loginLinkAction:
      presenter.onLoginLabelDidTap()
    default:
      break
    }
  }
}

// MARK: - RegisterViewControllerProtocol

extension RegisterViewController: RegisterViewProtocol {
  
}
