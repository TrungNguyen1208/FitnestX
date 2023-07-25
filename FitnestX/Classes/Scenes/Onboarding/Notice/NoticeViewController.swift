//
//  NoticeViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 25/07/2023.
//  
//

import UIKit

protocol NoticeViewProtocol: AnyObject {
    
}

protocol NoticeViewControllerDelegate: AnyObject {
  func primaryButtonNoticeDidTap()
}

final class NoticeViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var primaryButton: GradientButton!
  
  // MARK: - Public Variable
  
  public var presenter: NoticePresenterProtocol!
  public var viewModel: NoticeViewModel!
  weak var delegate: NoticeViewControllerDelegate?
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Action
  
  @IBAction private func primaryButtonDidTap() {
    delegate?.primaryButtonNoticeDidTap()
  }
}

// MARK: - Private

private extension NoticeViewController {
  func setupUI() {
    imageView.image = UIImage(named: viewModel.imageName)
    titleLabel.setAttributedText(from: viewModel.title, hideIfNil: true)
    subtitleLabel.setAttributedText(from: viewModel.subtitle, hideIfNil: true)
    descriptionLabel.setAttributedText(from: viewModel.description, hideIfNil: true)
    primaryButton.setTitle(viewModel.primaryButtonTitle, for: .normal)
  }
}

// MARK: - NoticeViewControllerProtocol

extension NoticeViewController: NoticeViewProtocol {
  
}
