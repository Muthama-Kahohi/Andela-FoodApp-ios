import UIKit

public class RatingViewModel {

    //MARK: Internal Properties

    internal var foodList = [MealItem]()

    //MARK: Public properties

    let cellName = "foodCell"

    //MARK: Public Methods

    public func getCurrentDate() -> String {

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
