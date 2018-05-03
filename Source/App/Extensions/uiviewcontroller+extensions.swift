import Foundation
import UIKit

public extension UIViewController {

    static func instantiate(from name: StoryboardName) -> Self? {
        let sb = UIStoryboard(name: name.rawValue,
                              bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "\(self)ID")

        return dynamicCast(vc,
                           as: self)
    }
}

private func dynamicCast<T>(_ object: Any,
                            as: T.Type) -> T? {
    return object as? T
}
