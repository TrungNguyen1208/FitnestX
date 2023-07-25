//
//  NoticePresenter.swift
//  FitnestX
//
//  Created by Trung Nguyen on 18/07/2023.
//  
//

import Foundation

protocol NoticePresenterProtocol: AnyObject {

}

final class NoticePresenter: NoticePresenterProtocol {
  
  // MARK: - Injected
  
  weak var view: NoticeViewProtocol?
  var router: NoticeRouterProtocol!

  // MARK: - Public
}
