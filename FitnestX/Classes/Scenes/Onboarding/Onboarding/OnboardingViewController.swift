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
  @IBOutlet private weak var progressRingView: ALProgressRing!
  
  // MARK: - Private Variable
  
  private lazy var presenter: OnboardingPresenter = {
    let presenter = OnboardingPresenter()
    presenter.view = self
    return presenter
  }()
  
  private var currentIndex: Int = 0
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func nextButtonDidTap() {
    let numberOfItems = presenter.onboardingViewModels.count
    if currentIndex < numberOfItems - 1 {
      currentIndex += 1
      pagerView.scrollToItem(at: currentIndex, animated: true)
      let progress = Float(currentIndex + 1) / Float(numberOfItems)
      progressRingView.setProgress(progress, animated: true)
    }
  }
}

// MARK: - Private

private extension OnboardingViewController {
  func setupUI() {
    progressRingView.grooveWidth = 0.5
    progressRingView.ringWidth = 2
    progressRingView.duration = 0.5
    progressRingView.startColor = R.color.blue9DCEFF()!
    progressRingView.endColor = R.color.blue92A3FD()!
    progressRingView.timingFunction = .linear
    progressRingView.setProgress(0.25, animated: false)
    
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
    presenter.onboardingViewModels.count
  }
  
  func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
    let cell = pagerView.dequeueReusableCell(withReuseIdentifier: OnboardingPagerViewCell.nibName(), at: index) as! OnboardingPagerViewCell
    let viewModel = presenter.onboardingViewModels[index]
    cell.update(with: viewModel)
    return cell
  }
  
  func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
    currentIndex = targetIndex
    let progress = Float(targetIndex + 1) / Float(presenter.onboardingViewModels.count)
    progressRingView.setProgress(progress, animated: true)
  }
}
