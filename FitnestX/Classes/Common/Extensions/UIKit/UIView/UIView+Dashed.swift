import Foundation
import UIKit

extension UIView {
    
    func addDashedBorder(strokeColor: UIColor, lineWidth: CGFloat, lineDashPattern: [NSNumber] = [5, 5]) {
        layoutIfNeeded()
        let strokeColor = strokeColor.cgColor
        
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: shapeRect.width, height: shapeRect.height),
                                       cornerRadius: layer.cornerRadius).cgPath
        
        layer.addSublayer(shapeLayer)
    }
    
  func addDashedLine(color: UIColor = UIColor.gray, lineDashPattern: [NSNumber] = [3, 3], lineWidth: CGFloat = 1) {
        _ = layer.sublayers?.filter({ $0.name == "DashedTopLine" }).map({ $0.removeFromSuperlayer() })
        backgroundColor = UIColor.clear
        let cgColor = color.cgColor
        
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.name = "DashedTopLine"
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = cgColor
        shapeLayer.lineWidth = lineWidth// / UIScreen.main.scale
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = lineDashPattern
        
        let path: CGMutablePath = CGMutablePath()
        path.move(to: CGPoint.zero)
    
        path.addLine(to: CGPoint(x: frame.width, y: 0))

        shapeLayer.path = path
        
        layer.addSublayer(shapeLayer)
    }
}
