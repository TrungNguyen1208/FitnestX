//
//  UIView+Extensions.swift
//  RMCommerce
//
//  Created by Bradley Hoang on 26/07/2022.
//

import UIKit

extension UIView {
  
  func addShadowView(withColor color: UIColor) {
    self.layer.applySketchShadow(color: color, alpha: 0.11, xLocation: 0, yLocation: 20, blur: 40, spread: 7)
  }
  
  func makeRounded(
    radius: CGFloat,
    corners: UIRectCorner,
    frame: CGRect? = nil,
    borderWidth: CGFloat = 0,
    borderColor: UIColor? = nil
  ) {
    if let frame = frame {
      self.bounds = frame
    }
    let maskPath1 = UIBezierPath(roundedRect: bounds,
                                 byRoundingCorners: corners,
                                 cornerRadii: CGSize(width: radius, height: radius))
    let maskLayer1 = CAShapeLayer()
    maskLayer1.frame = bounds
    maskLayer1.path = maskPath1.cgPath
    
    if borderWidth > 0 {
      let borderLayer = CAShapeLayer()
      borderLayer.path = maskPath1.cgPath
      borderLayer.lineWidth = borderWidth
      borderLayer.strokeColor = borderColor?.cgColor ?? UIColor.lightGray.cgColor
      borderLayer.fillColor = UIColor.clear.cgColor
      
      layer.addSublayer(borderLayer)
    }
    
    layer.mask = maskLayer1
  }
}

extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.11,
    xLocation: CGFloat = 0,
    yLocation: CGFloat = 20,
    blur: CGFloat = 40,
    spread: CGFloat = 7
  ) {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: xLocation, height: yLocation)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dxLocation = -spread
      let rect = bounds.insetBy(dx: dxLocation, dy: dxLocation)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}

extension UIView {
  func addShadow(
    shadowColor: UIColor,
    offSet: CGSize,
    opacity: Float,
    shadowRadius: CGFloat,
    cornerRadius: CGFloat,
    corners: UIRectCorner,
    fillColor: UIColor = .clear
  ) {
    let shadowLayer = CAShapeLayer()
    let size = CGSize(width: cornerRadius, height: cornerRadius)
    let cgPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath // 1
    shadowLayer.path = cgPath // 2
    shadowLayer.fillColor = fillColor.cgColor // 3
    shadowLayer.shadowColor = shadowColor.cgColor // 4
    shadowLayer.shadowPath = cgPath
    shadowLayer.shadowOffset = offSet // 5
    shadowLayer.shadowOpacity = opacity
    shadowLayer.shadowRadius = shadowRadius
    self.layer.addSublayer(shadowLayer)
  }
}

extension UIStackView {
  func addBackground(color: UIColor, cornerRadius: CGFloat = 0) {
    let subview = UIView(frame: bounds)
    subview.cornerRadius = cornerRadius
    subview.backgroundColor = color
    subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    insertSubview(subview, at: 0)
  }
}
