
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

        let sampleFood = MealItem(id: 4, name: "Ugali")
        let sampleFood1 = MealItem(id: 1, name: "Spinach")
        let sampleFood2 = MealItem(id: 5, name: "Mbuzi Fry")
        let sampleFood3 = MealItem(id: 3, name: "Mixed Veggies")
        let sampleFood4 = MealItem(id: 2, name: "Mukimo")

        foodList += [sampleFood, sampleFood1, sampleFood2, sampleFood3, sampleFood4]
    }
}
