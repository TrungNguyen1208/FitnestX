//
//  CompleteProfileViewController.swift
//  FitnestX
//
//  Created by Quang Thanh on 09/12/2022.
//

import UIKit

final class CompleteProfileViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var nextButton: GradientButton!
  @IBOutlet weak var kgButton: GradientButton!
  @IBOutlet weak var cmButton: GradientButton!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  // MARK: - Action
  
  @IBAction func nextButtonDidTapped() {
    let vc = RegisterViewController.makeMe()
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Private

private extension CompleteProfileViewController {
  func setupUI() {
  }
}

