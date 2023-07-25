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

final class NoticeViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var primaryButton: GradientButton!
  
  // MARK: - Public Variable
  
  public var presenter: NoticePresenterProtocol!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
}

// MARK: - Private

private extension NoticeViewController {
  func setupUI() {
    
  }
}

// MARK: - NoticeViewControllerProtocol

extension NoticeViewController: NoticeViewProtocol {
  
}
