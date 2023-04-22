import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0.0...1.0),
                       green: .random(in: 0.0...1.0),
                       blue: .random(in: 0.0...1.0),
                       alpha: .random(in: 0.0...1.0))
    }
}
