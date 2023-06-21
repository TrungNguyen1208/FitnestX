//
//  FitnestActionCardView.swift
//  FitnestX
//
//  Created by Trung Nguyen on 17/06/2023.
//

import Foundation

struct FitnestActionCardViewModel: Equatable {
  let title: String?
  let actionText: String?
}

protocol FitnestActionCardViewDelegate: AnyObject {
  func fitnestActionCardViewDidTapActionButton()
}

final class FitnestActionCardView: NibView {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var actionButton: GradientButton!
  
  // MARK: - Variable
  
  weak var delegate: FitnestActionCardViewDelegate?
  
  // MARK: - Lifecycle
  
  override func configureView() {
    super.configureView()
    setupUI()
  }
  
  func update(with viewModel: FitnestActionCardViewModel) {
    titleLabel.text = viewModel.title
    actionButton.setTitle(viewModel.actionText, for: .normal)
  }
  
  
}


// MARK: - Private

private extension FitnestActionCardView {
  func setupUI() {
    
  }
  
  // MARK: - Action
  
  @IBAction private func actionButtonDidTap() {
    delegate?.fitnestActionCardViewDidTapActionButton()
  }
}
