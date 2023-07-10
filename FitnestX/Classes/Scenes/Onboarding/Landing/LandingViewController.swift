//
//  LandingViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 05/07/2023.
//  
//

import UIKit

protocol LandingViewProtocol: AnyObject {
    
}

final class LandingViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var getStartedButton: GradientButton!
  
  // MARK: - Public Variable
  
  public var presenter: LandingPresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    subtitleLabel.text = R.string.localizable.landing_page_subtitle.localized()
    getStartedButton.setTitle(R.string.localizable.common_get_started.localized(), for: .normal)
  }
  
  // MARK: - Action
  
  @IBAction private func startButtonDidTap() {
    presenter.onGetStartedButtonDidTap()
  }
}

// MARK: - Private

private extension LandingViewController {
  func setupUI() {
    
  }
}

// MARK: - LandingViewControllerProtocol

extension LandingViewController: LandingViewProtocol {
  
}
