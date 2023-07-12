//
//  AppAssembly.swift
//  FitnestX
//
//  Created by Trung Nguyen on 07/07/2023.
//

import Foundation
import Swinject

final class AppAssembly {
  static let current: Assembler = {
    var assemblies: [Assembly] = []
    assemblies.append(FormattersAssembly())
    assemblies.append(ValidatorsAssembly())
    assemblies.append(contentsOf: ModulesAssembly.container)
    assemblies.append(contentsOf: ServicesAssembly.container)
    return Assembler(assemblies)
  }()
  
  private init() {}
  
}
