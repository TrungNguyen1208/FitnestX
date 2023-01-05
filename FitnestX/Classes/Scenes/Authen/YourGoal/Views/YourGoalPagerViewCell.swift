//
//  YourGoalPagerViewCell.swift
//  FitnestX
//
//  Created by Trung Nguyen on 13/12/2022.
//

import UIKit

final class YourGoalPagerViewCell: FSPagerViewCell {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var cardImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func update(with viewModel: YourGoalPagerViewModel) {
    cardImageView.image = viewModel.image
    titleLabel.text = viewModel.title
    subtitleLabel.text = viewModel.subtitle
  }
}
