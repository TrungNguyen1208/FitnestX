import UIKit

/**
 final class for loading view from Nib
 */
class NibView: UIView {
  
  // MARK: - Initializers
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupNib()
    configureView()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupNib()
    awakeFromNib()
    configureView()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setupNib()
  }
  
  init() {
    super.init(frame: .zero)
    setupNib()
    configureView()
  }
}

// MARK: - Private

private extension NibView {
  
  func setupNib() {
    backgroundColor = .clear
    let nibName = NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
    let topLevelViews = nib.instantiate(withOwner: self, options: nil)
    let nibView = topLevelViews.first as! UIView
    insertSubview(nibView, at: 0)
    
    nibView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      nibView.leftAnchor.constraint(equalTo: leftAnchor),
      nibView.rightAnchor.constraint(equalTo: rightAnchor),
      nibView.topAnchor.constraint(equalTo: topAnchor),
      nibView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

extension NibView {
  @objc func configureView() {}
}
