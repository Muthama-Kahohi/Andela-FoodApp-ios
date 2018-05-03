import Foundation

extension UserDefaults {

      func setMeal1(value: String) {

        set(value, forKey: userDefaultKeys.meal1.rawValue)
    }

     func setMeal2(value: String) {

        set(value, forKey: userDefaultKeys.meal2.rawValue)
    }

    func getMeal1() -> String {

        guard let mealType = string(forKey: userDefaultKeys.meal1.rawValue) else {

            return "nil"
        }

        return mealType
    }

    func getMeal2() -> String {

        guard let mealType = string(forKey: userDefaultKeys.meal2.rawValue) else {

            return "nil"
        }
        return mealType
    }
}

enum userDefaultKeys: String {

    case meal1
    case meal2
}
