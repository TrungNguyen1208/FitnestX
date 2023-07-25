//
//  NoticeViewModel.swift
//  FitnestX
//
//  Created by Trung Nguyen on 25/07/2023.
//

import Foundation

struct NoticeViewModel: Equatable {
  let imageName: String
  let title: String?
  let subtitle: String?
  let description: String?
  let primaryButtonTitle: String
  
  init(
    imageName: String,
    title: String? = nil,
    subtitle: String? = nil,
    description: String? = nil,
    primaryButtonTitle: String
  ) {
    self.imageName = imageName
    self.title = title
    self.subtitle = subtitle
    self.description = description
    self.primaryButtonTitle = primaryButtonTitle
  }
}
