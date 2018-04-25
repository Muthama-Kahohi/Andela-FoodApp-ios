import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    var userNameFromEmail: String {

        let index = self.endIndex
        let newIndex = self.index(index, offsetBy: -11)
        let name = self[..<newIndex]
        let userName = name.replacingOccurrences(of: ".", with: " ")
        return userName.capitalized
    }    
}
