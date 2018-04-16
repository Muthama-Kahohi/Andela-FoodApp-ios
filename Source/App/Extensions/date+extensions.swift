import UIKit

extension Date {

    public func dateToString(date: Date) -> String {

        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        return formatter.string(from: date)
    }
}
