//
//  GradientButton.swift
//  FitnestX
//
//  Created by Trung Nguyen on 24/11/2022.
//

import UIKit

@IBDesignable
open class GradientButton: UIButton {
  
  @IBInspectable
  open var gradientCornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = gradientCornerRadius
    }
  }
  
  @IBInspectable
  open var startColor: UIColor = UIColor.black {
    didSet {
      gradientLayer.colors = [ startColor.cgColor, endColor.cgColor ]
    }
  }
  
  @IBInspectable
  open var endColor: UIColor = UIColor.white {
    didSet {
      gradientLayer.colors = [ startColor.cgColor, endColor.cgColor ]
    }
  }
  
  @IBInspectable
  open var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.5) {
    didSet {
      gradientLayer.startPoint = startPoint
    }
  }
  
  @IBInspectable
  open var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5) {
    didSet {
      gradientLayer.endPoint = endPoint
    }
  }
  
  private lazy var gradientLayer: CAGradientLayer = {
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.locations = [0.0, 1.0]
    gradient.needsDisplayOnBoundsChange = true
    gradient.colors = [startColor, endColor].map { $0.cgColor }
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    return gradient
  }()
  
  //MARK: Init
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  override public func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
  
  open override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    gradientLayer.frame = bounds
  }
}

private extension GradientButton {
  func setup() {
    layer.insertSublayer(gradientLayer, at: 0)
    setCornerRadius()
  }
  
  func setCornerRadius() {
    layer.cornerRadius = cornerRadius
    layer.masksToBounds = true
    if #available(iOS 13.0, *) {
      layer.cornerCurve = .continuous
    }
  }
}
