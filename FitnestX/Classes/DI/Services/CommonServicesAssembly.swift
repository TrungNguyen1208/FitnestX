import Foundation
import Swinject

final class CommonServicesAssembly: Assembly {
  func assemble(container: Container) {
    registerDefaultsStorage(in: container)
    registerNotificationCenterService(in: container)
    registerAppCoordinator(in: container)
  }
}

private extension CommonServicesAssembly {
  func registerDefaultsStorage(in container: Container) {
    container.register(DefaultsStorage.self) { _ in
      return DefaultsStorageImpl(userDefaultsProvider: UserDefaults.standard)
    }
  }
  
  func registerAppCoordinator(in container: Container) {
    container.register(AppCoordinator.self) { (r) in
      let appCoordinatorImpl = AppCoordinatorImpl()
      appCoordinatorImpl.rootViewControllerProvider = r.resolve(RootViewControllerProvider.self)
      appCoordinatorImpl.rootControllerPresenter = r.resolve(RootControllerPresenter.self)
      appCoordinatorImpl.notificationCenterService = r.resolve(NotificationCenterService.self)
      return appCoordinatorImpl
    }
    
    container.register(RootViewControllerProvider.self) { (_) in
      let rootViewControllerProvider = RootViewControllerProviderImpl()
      return rootViewControllerProvider
    }
    
    container.register(RootControllerPresenter.self) { (_) in
      let rootControllerPresenter = RootControllerPresenterImpl()
      return rootControllerPresenter
    }
  }
  
  func registerNotificationCenterService(in container: Container) {
    container.register(NotificationCenterService.self) { (_) in
      return NotificationCenter.default
    }
    .inObjectScope(.container)
  }
}
