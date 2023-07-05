import UIKit

protocol OnboardingViewProtocol: AnyObject {
  func scrollToItem(at index: Int)
  func setProgressRingView(_ value: Float)
}

final class OnboardingViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var pagerView: FSPagerView!
  @IBOutlet private weak var progressRingView: ALProgressRing!
  
  // MARK: - Public Variable
  
  public var presenter: OnboardingPresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Action
  
  @IBAction private func nextButtonDidTap() {
    presenter.onNextButtonDidTap()
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
    
    setupCollectionView()
  }
  
  func setupCollectionView() {
    pagerView.register(OnboardingPagerViewCell.nib(), forCellWithReuseIdentifier: OnboardingPagerViewCell.nibName())
    pagerView.delegate = self
    pagerView.dataSource = self
  }
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
    presenter.onMoveToItem(at: targetIndex)
  }
}

// MARK: - OnboardingViewProtocol

extension OnboardingViewController: OnboardingViewProtocol {
  func scrollToItem(at index: Int) {
    pagerView.scrollToItem(at: index, animated: true)
  }
  
  func setProgressRingView(_ value: Float) {
    progressRingView.setProgress(value, animated: true)
  }
}
