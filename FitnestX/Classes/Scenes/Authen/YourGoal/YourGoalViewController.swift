import Foundation
import UIKit

final class YourGoalViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var pagerView: FSPagerView!
  
  private let cellViewModels: [YourGoalPagerViewModel] = [
    YourGoalPagerViewModel(
      image: R.image.yourGoalCard1(),
      title: "Improve Shape",
      subtitle: "I have a low amount of body fat and need / want to build more muscle"
    ),
    YourGoalPagerViewModel(
      image: R.image.yourGoalCard2(),
      title: "Lean & Tone",
      subtitle: "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way"
    ),
    YourGoalPagerViewModel(
      image: R.image.yourGoalCard3(),
      title: "Lose a Fat",
      subtitle: "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass"
    )
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
