//
//  GoalViewController.swift
//  FitnestX
//
//  Created by Quang Thanh on 13/12/2022.
//

import Foundation
final class GoalViewController: BaseViewController {
  
  private let goalViewModels: [GoalViewModel] = [
      GoalViewModel(image: R.image.goalCard1(), title: "I have a low amount of body fat and need / want to build more muscle", subtitle: "Improve Shape"),
      GoalViewModel(image: R.image.goalCard2(), title: "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way", subtitle: "Lean & Tone"),
      GoalViewModel(image: R.image.goalCard3(), title: "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass", subtitle: "Lose a Fat")
    ]
  // MARK: - IBOutlet
  @IBOutlet weak var confirmButton: GradientButton!
  @IBOutlet weak var pagerView: FSPagerView!
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func nextButtonDidTapped() {
    let vc = GoalViewController.makeMe()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension GoalViewController {
  func setupUI() {
    pagerView.register(GoalCollectionViewCell.nib(), forCellWithReuseIdentifier: GoalCollectionViewCell.nibName())
    pagerView.delegate = self
    pagerView.dataSource = self
    pagerView.transformer = FSPagerViewTransformer(type: .linear)
    pagerView.decelerationDistance = FSPagerView.automaticDistance
    pagerView.interitemSpacing = 20
    pagerView.itemSize = CGSize(width: 245, height: 478)
    pagerView.isInfinite = true
  }
}

// MARK: - FSPagerViewDataSource, FSPagerViewDelegate
extension GoalViewController: FSPagerViewDataSource, FSPagerViewDelegate {
  func numberOfItems(in pagerView: FSPagerView) -> Int {
    return goalViewModels.count
  }
  
  func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
    let cell = pagerView.dequeueReusableCell(withReuseIdentifier: GoalCollectionViewCell.nibName(), at: index) as! GoalCollectionViewCell
    let viewModel = goalViewModels[index]
    cell.update(with: viewModel)
    return cell
  }
}
