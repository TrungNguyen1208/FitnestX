//
//  GoalCollectionViewCell.swift
//  FitnestX
//
//  Created by Quang Thanh on 15/12/2022.
//

import UIKit

class GoalCollectionViewCell: FSPagerViewCell {
  // MARK: - IBOutlet
  
  @IBOutlet private weak var goalImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitLabel: UILabel!
  @IBOutlet private weak var backgroundButton: GradientButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

  func update(with viewModel: GoalViewModel) {
    goalImageView.image = viewModel.image
    titleLabel.text = viewModel.title
    subtitLabel.text = viewModel.subtitle
  }
}
