//
//  YourGoalViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 13/12/2022.
//

import Foundation
import UIKit

final class YourGoalViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var pagerView: FSPagerView!
  
  private let cellViewModels: [YourGoalPagerViewModel] = [
    YourGoalPagerViewModel(image: R.image.yourGoalCard1(), title: "1312312", subtitle: "213534dfgghdbfgvb xfgbgx"),
    YourGoalPagerViewModel(image: R.image.yourGoalCard1(), title: "234124124", subtitle: "Quang dep trai"),
    YourGoalPagerViewModel(image: R.image.yourGoalCard1(), title: "Trung", subtitle: "Trung dep trai")
  ]
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
}

// MARK: - Private

private extension YourGoalViewController {
  func setupUI() {
    pagerView.register(YourGoalPagerViewCell.nib(), forCellWithReuseIdentifier: YourGoalPagerViewCell.nibName())
    pagerView.delegate = self
    pagerView.dataSource = self
    pagerView.itemSize = CGSize(width: 275, height: 478)
    
    let transformer =  FSPagerViewTransformer(type: .linear)
    transformer.minimumScale = 0.5
    pagerView.transformer = transformer
    pagerView.decelerationDistance = FSPagerView.automaticDistance
    pagerView.interitemSpacing = 20
  }
}

// MARK: - FSPagerViewDataSource, FSPagerViewDelegate

extension YourGoalViewController: FSPagerViewDataSource, FSPagerViewDelegate {
  func numberOfItems(in pagerView: FSPagerView) -> Int {
    return cellViewModels.count
  }
  
  func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
    let cell = pagerView.dequeueReusableCell(withReuseIdentifier: YourGoalPagerViewCell.nibName(), at: index) as! YourGoalPagerViewCell
    let viewModel = cellViewModels[index]
    cell.update(with: viewModel)
    return cell
  }
}
