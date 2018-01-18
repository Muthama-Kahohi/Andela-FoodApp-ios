
import Foundation

class MealsViewModel {

    let cellIdentifier = "mealcell"
    var foodList = [MealItem]()

    public func displayCurrentDate() -> String {

        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        return formatter.string(from: now)
    }

    public func loadSampleMeal() {

        let sampleFood = MealItem(name: "Ugali", rating: 4)
        let sampleFood1 = MealItem(name: "Spinach", rating: 1)
        let sampleFood2 = MealItem(name: "Mbuzi Fry", rating: 5)
        let sampleFood3 = MealItem(name: "Mixed Veggies", rating: 3)
        let sampleFood4 = MealItem(name: "Mukimo", rating: 2)

        foodList += [sampleFood, sampleFood1, sampleFood2, sampleFood3, sampleFood4]
    }
}
