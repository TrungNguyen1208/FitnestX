import Foundation

protocol NotificationCenterService {
  func post(name aName: NSNotification.Name, object anObject: Any?)
  func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable: Any]?)
  
  func addObserver(_ object: AnyObject, forName name: NSNotification.Name?, using block: @escaping (Notification) -> Swift.Void)
  func removeObserver(_ object: AnyObject)
}

extension NotificationCenter: NotificationCenterService {}

extension NotificationCenter {
  private static var observers: [ObjectIdentifier: [NSObjectProtocol]] = [:]
  private static let observerQueue = DispatchQueue(label: "com.fitnestx.services.NotificationCenterService.NotificationCenter.ObserverQueue")
  
  func addObserver(_ object: AnyObject, forName name: NSNotification.Name?, using block: @escaping (Notification) -> Swift.Void) {
    let observer = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
    let identifier = ObjectIdentifier(object)
    NotificationCenter.observerQueue.async {
      NotificationCenter.observers[identifier, default: []].append(observer)
    }
  }
  
  func removeObserver(_ object: AnyObject) {
    let identifier = ObjectIdentifier(object)
    var observers = [NSObjectProtocol]()
    NotificationCenter.observerQueue.sync {
      observers = NotificationCenter.observers[identifier] ?? []
      NotificationCenter.observers[identifier] = nil
    }
    observers.forEach { (observer) in
      NotificationCenter.default.removeObserver(observer as Any)
    }
    NotificationCenter.default.removeObserver(object as Any)
  }
}
