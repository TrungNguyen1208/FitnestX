//
//  LoginViewController.swift
//  FitnestX
//
//  Created by Quang Thanh on 05/12/2022.
//

import Foundation

final class LoginViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var getStartedButton: GradientButton!
  @IBOutlet weak var forgotPasswordLabel: UILabel!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func applyLocalization() {
    
  }
  
  @IBAction private func getStartedButtonDidTapped() {

  }
}
    
// MARK: - Private

private extension LoginViewController {
  func setupUI() {
    forgotPasswordLabel.attributedText = NSAttributedString(
      string: "Forgot your password?",
      attributes:
        [
          .underlineStyle: NSUnderlineStyle.single.rawValue,
          .font: R.font.poppinsRegular(size: 12)!,
          .foregroundColor: R.color.grayADA4A5()!
        ]
    )
  }
}
