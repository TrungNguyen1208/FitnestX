//
//  LandingViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 23/11/2022.
//  
//

import UIKit

final class LandingViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var getStartedButton: GradientButton!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func startButtonDidTap() {
    let vc = OnboardingBuilder.build()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension LandingViewController {
  func setupUI() {
    
  }
}
