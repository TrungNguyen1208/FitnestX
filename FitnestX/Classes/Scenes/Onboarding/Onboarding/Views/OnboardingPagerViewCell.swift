//
//  OnboardingPagerViewCell.swift
//  FitnestX
//
//  Created by Trung Nguyen on 24/11/2022.
//

import UIKit

final class OnboardingPagerViewCell: FSPagerViewCell {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var onboardingImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func update(with viewModel: OnboardingViewModel) {
    onboardingImageView.image = UIImage(named: viewModel.image)
    titleLabel.text = viewModel.title
    subtitleLabel.text = viewModel.subtitle
  }
}
