//
//  FitnestBannerView.swift
//  FitnestX
//
//  Created by Tiến Ngô on 18/06/2023.
//

import UIKit
import Foundation

final class FitnestBannerView: NibView {
  
  // MARK: - Outlet

  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var bannerImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var actionButton: GradientButton!
  
  // MARK: - Property
  
  
  // MARK: - LifeCycle
  
  override func configureView() {
    super.configureView()
  }
}

// MARK: - Private

private extension FitnestBannerView {
  
  func setupUI() {
    
  }
}
