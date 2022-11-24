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
  
  @IBOutlet private weak var pagerView: FSPagerView!
  
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
    pagerView.register(OnboardingPagerViewCell.nib(), forCellWithReuseIdentifier: OnboardingPagerViewCell.nibName())
    pagerView.delegate = self
    pagerView.dataSource = self
  }
}

// MARK: - OnboardingViewInput

extension OnboardingViewController: OnboardingViewInput {
  
}

// MARK: - FSPagerViewDataSource, FSPagerViewDelegate

extension OnboardingViewController: FSPagerViewDataSource, FSPagerViewDelegate {
  func numberOfItems(in pagerView: FSPagerView) -> Int {
    return 4
  }
  
  func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
    let cell = pagerView.dequeueReusableCell(withReuseIdentifier: OnboardingPagerViewCell.nibName(), at: index)
    return cell
  }
}
