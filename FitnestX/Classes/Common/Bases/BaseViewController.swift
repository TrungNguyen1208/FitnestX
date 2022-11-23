import UIKit

class BaseViewController: UIViewController {
  // MARK: - Public properties
  
  var hasLargeTitle: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    applyLocalization()
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(applyLocalization),
                                           name: LocalizationNotification.didChange,
                                           object: nil)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = hasLargeTitle
  }
  
  @objc func applyLocalization() {}
}
