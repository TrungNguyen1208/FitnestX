//
//  OnboardingViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 24/11/2022.
//  
//

import UIKit

final class OnboardingViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  // MARK: - Private Variable
  
  private lazy var presenter: OnboardingPresenter = {
    let presenter = OnboardingPresenter()
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
}

// MARK: - Private

private extension OnboardingViewController {
  func setupUI() {
    
  }
}

// MARK: - OnboardingViewInput

extension OnboardingViewController: OnboardingViewInput {
  
}
