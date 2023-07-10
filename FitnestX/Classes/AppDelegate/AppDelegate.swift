import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator: AppCoordinator?
  
  private var container: Container {
    return AppAssembly.current.resolver as! Container
  }

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
    appCoordinator = container.resolve(AppCoordinator.self)
    appCoordinator?.setup(with: window!)
    appCoordinator?.launch()
  }
  
  func setupExternalServicesConfig(in application: UIApplication, with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    // Setup Google Map, Firebase, External Service here
  }
}
