import Foundation
import Swinject

final class ModulesAssembly {
  static let container: [Assembly] = {
    var modules: [Assembly] = []
    modules.append(contentsOf: onboardingModulesAssembly())
    modules.append(contentsOf: mainModulesAssembly())
    return modules
  }()
  
  private static func onboardingModulesAssembly() -> [Assembly] {
    return [
      LandingAssembly(),
      OnboardingAssembly(),
      NoticeAssembly(),
      LoginAssembly(),
      RegisterAssembly()
    ]
  }
  
  private static func mainModulesAssembly() -> [Assembly] {
    return [
      DashboardAssembly()
    ]
  }
}
