import UIKit

class gradientView: UIView {
    override func draw(_ rect: CGRect) {
        self.setGradientBackground()
    }
   private func setGradientBackground() {
    let topColor = UIColor(red: (113/255.0), green: (40/255.0), blue:(126/255.0), alpha: 1)
    let bottomColor = UIColor(red: (163/255.0), green: (9/255.0), blue:(104/255.0), alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
