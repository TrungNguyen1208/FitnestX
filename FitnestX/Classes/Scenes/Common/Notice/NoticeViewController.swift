//
//  NoticeViewController.swift
//  FitnestX
//
//  Created by Trung Nguyen on 18/07/2023.
//  
//

import UIKit

protocol NoticeViewProtocol: AnyObject {
    
}

final class NoticeViewController: BaseViewController {
  
  // MARK: - IBOutlet
  
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
