import UIKit

extension UIButton {

    var id: String {

        let tag = self.tag
        switch tag {
        case 0:
            return "breakfast"

        case 1:
            return "lunch"

        case 2:
            return "dinner"

        default:

            return "None"
        }
    }
}
