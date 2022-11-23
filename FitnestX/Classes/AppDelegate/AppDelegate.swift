//
//  AppDelegate.swift
//  FitnestX
//
//  Created by Trung Nguyen on 23/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator: AppCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow()
    setupAppearance()
    setupExternalServicesConfig(in: application, with: launchOptions)
    setupAppCoordinator()
    window?.makeKeyAndVisible()
    return true
  }
  
  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    .portrait
  }

}

// MARK: - Private

private extension AppDelegate {
  func setupAppCoordinator() {
    appCoordinator = AppCoordinatorImpl()
    appCoordinator?.setup(with: window!)
    appCoordinator?.launch()
  }
  
  func setupExternalServicesConfig(in application: UIApplication, with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {

  }
}
